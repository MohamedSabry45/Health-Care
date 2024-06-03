
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gp/core/constansts/asset_manger.dart';
import 'package:gp/core/constansts/context_extensions.dart';
import 'package:gp/core/theme/app_colors.dart';
import 'package:gp/features/user/presentation/cubit/user_cubit.dart';

class ProfileImageWidget extends StatelessWidget {
   ProfileImageWidget({
    super.key, this.width, this.height,
  });
  final double? width;
  final double? height;
  final UserCubit userCubit = Modular.get<UserCubit>();
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if ( userCubit.user?.photoUrl != null) {
            return CachedNetworkImage(imageUrl: userCubit.user!.photoUrl!,
              fit: BoxFit.cover,
              height:height?? context.propHeight(50),
              width:width?? context.propWidth(50),);
          }
          else {
            return Image.asset(
            AssetManger.user,
            fit: BoxFit.cover,
            height:width?? context.propHeight(24),
            width:height?? context.propHeight(25),
            color: HexColor("FFFFFF"),
          );
          }
        },
      ),
    );
  }
}
