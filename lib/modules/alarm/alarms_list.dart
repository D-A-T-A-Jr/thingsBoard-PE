import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:thingsboard_app/core/entity/entity_list_card.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/alarms_bloc.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/alarms_events.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/alarms_card.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/ui/pagination_widgets/first_page_exception_widget.dart';
import 'package:thingsboard_app/utils/ui/pagination_widgets/first_page_progress_builder.dart';
import 'package:thingsboard_app/utils/ui/pagination_widgets/new_page_progress_builder.dart';
import 'package:thingsboard_app/utils/ui/pagination_widgets/pagination_list_widget.dart';

class AlarmsList extends StatelessWidget {
  const AlarmsList({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh:
          () async => getIt<AlarmBloc>().add(const AlarmsRefreshPageEvent()),
      child: PaginationListWidget<AlarmQueryV2, AlarmInfo>(
        pagingController:
            getIt<AlarmBloc>().paginationRepository.pagingController,
        builderDelegate: PagedChildBuilderDelegate(
          itemBuilder: (context, alarm, index) {
            return EntityListCard(
              alarm,
              entityCardWidgetBuilder: (_, alarm) {
                return AlarmCard(alarm: alarm);
              },
            );
          },
          firstPageProgressIndicatorBuilder:
              (_) => const FirstPageProgressBuilder(),
          newPageProgressIndicatorBuilder:
              (_) => const NewPageProgressBuilder(),
          firstPageErrorIndicatorBuilder: (context) {
            final error = getIt<AlarmBloc>().paginationRepository.pagingController.error;
            return Center(child: Text('Erro ao carregar alarmes: $error', textAlign: TextAlign.center, style: const TextStyle(color: Colors.red)));
          },
          noItemsFoundIndicatorBuilder: (context) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.alarm_off, size: 48, color: Colors.grey[400]),
                const SizedBox(height: 16),
                Text(
                  S.of(context).noAlarmsFound,
                  style: const TextStyle(fontSize: 18, color: Colors.grey),
                ),
                Text(
                  S.of(context).listIsEmptyText,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
