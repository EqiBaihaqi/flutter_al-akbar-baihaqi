import 'package:assets_dialogbottomsheet_navgator/bloc/button_bloc_bloc.dart';
import 'package:assets_dialogbottomsheet_navgator/const/date_format_constant.dart';
import 'package:assets_dialogbottomsheet_navgator/utils/contact_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ListContact extends StatelessWidget {
  const ListContact({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactProvider>(
      builder: (context, provider, child) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: ListView.builder(
            itemCount: provider.listContact.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text(provider.listContact[index].username[0]),
                ),
                title: Text(provider.listContact[index].username),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(provider.listContact[index].nomor),
                    Text(DateFormatConstant.getDayDateHours(
                        provider.listContact[index].tanggal)),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: provider.listContact[index].warna),
                    ),
                    Text(
                      provider.listContact[index].filePilih.name,
                      maxLines: 1,
                    )
                  ],
                ),
                trailing: Wrap(
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                    BlocBuilder<ButtonBlocBloc, ButtonBlocState>(
                      builder: (context, state) {
                        return IconButton(
                            onPressed: () {
                              // provider.deleteData(index);
                              context
                                  .read<ButtonBlocBloc>()
                                  .add(DeleteContactEvent(index));
                            },
                            icon: const Icon(Icons.delete));
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
