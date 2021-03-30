Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0F834DD96
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 03:34:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A4E6E7F5;
	Tue, 30 Mar 2021 01:34:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m176151.mail.qiye.163.com (m176151.mail.qiye.163.com
 [59.111.176.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA1676E7F5;
 Tue, 30 Mar 2021 01:34:26 +0000 (UTC)
Received: from vivo.com (wm-11.qy.internal [127.0.0.1])
 by m176151.mail.qiye.163.com (Hmail) with ESMTP id A2C0C481FE3;
 Tue, 30 Mar 2021 09:34:22 +0800 (CST)
Message-ID: <ADoALwDyDqqKqolXZoBMHqqQ.3.1617068062644.Hmail.wanjiabing@vivo.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: =?UTF-8?B?UmU6UmU6IFtQQVRDSF0gYW1kOiBkaXNwbGF5OiBkYzogc3RydWN0IGRjX3N0YXRlIGlzIGRlY2xhcmVkIHR3aWNl?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 36.152.145.182
In-Reply-To: <CADnq5_PSnvFAcUt7T9q=L8v6sFGnLM72cot=Lq_+cs8cNHK5sg@mail.gmail.com>
MIME-Version: 1.0
Received: from wanjiabing@vivo.com( [36.152.145.182) ] by ajax-webmail (
 [127.0.0.1] ) ; Tue, 30 Mar 2021 09:34:22 +0800 (GMT+08:00)
From: =?UTF-8?B?5LiH5a625YW1?= <wanjiabing@vivo.com>
Date: Tue, 30 Mar 2021 09:34:22 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZTU9LSUtNHkhLT0oeVkpNSkxLTUNLTUlNQkNVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kJHlYWEh9ZQU1JT09DTUlKS01PN1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
 WUc6PxQ6Nww*Aj8KCjAKFBcjIRQ5NjMKCipVSFVKTUpMS01DS01IS01JVTMWGhIXVQwaFRESGhkS
 FRw7DRINFFUYFBZFWVdZEgtZQVlITVVKTklVSk9OVUpDSVlXWQgBWUFDTklCNwY+
X-HM-Tid: 0a7880c477d393b5kuwsa2c0c481fe3
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Krunoslav Kovac <Krunoslav.Kovac@amd.com>, Jacky Liao <ziyu.liao@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 kael_w@yeah.net, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 
>On Sat, Mar 27, 2021 at 3:28 AM Wan Jiabing <wanjiabing@vivo.com> wrote:
>>
>> struct dc_state has been declared at 273rd line.
>> Remove the duplicate.
>> Delete duplicate blank lines.
>
>Can you split these into separate patches?
>
>Alex

OK. But in fact, what I did  is simple.
The most important thing is removing the duplicate
struct dc_state declaration at 585th line.
Others are all deleting duplicate blank lines.

So maybe I should send two patchs, one is removing
duplicate declaration, the other is deleting blank lines?

>>
>> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
>> ---
>>  drivers/gpu/drm/amd/display/dc/dc.h | 10 ----------
>>  1 file changed, 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
>> index 18ed0d3f247e..dc667298ab5b 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dc.h
>> +++ b/drivers/gpu/drm/amd/display/dc/dc.h
>> @@ -234,7 +234,6 @@ struct dc_static_screen_params {
>>         unsigned int num_frames;
>>  };
>>
>> -
>>  /* Surface update type is used by dc_update_surfaces_and_stream
>>   * The update type is determined at the very beginning of the function based
>>   * on parameters passed in and decides how much programming (or updating) is
>> @@ -272,7 +271,6 @@ struct dc;
>>  struct dc_plane_state;
>>  struct dc_state;
>>
>> -
>>  struct dc_cap_funcs {
>>         bool (*get_dcc_compression_cap)(const struct dc *dc,
>>                         const struct dc_dcc_surface_param *input,
>> @@ -281,7 +279,6 @@ struct dc_cap_funcs {
>>
>>  struct link_training_settings;
>>
>> -
>>  /* Structure to hold configuration flags set by dm at dc creation. */
>>  struct dc_config {
>>         bool gpu_vm_support;
>> @@ -581,7 +578,6 @@ struct dc_bounding_box_overrides {
>>         int min_dcfclk_mhz;
>>  };
>>
>> -struct dc_state;

Removing the duplicate is here.
And others are all deleting duplicate blank line.

I think they are in the same file. I want to remove the declaration first.
By the way, I deleted the blank line.

Yours,
Wan Jiabing

>>  struct resource_pool;
>>  struct dce_hwseq;
>>  struct gpu_info_soc_bounding_box_v1_0;
>> @@ -757,7 +753,6 @@ enum dc_transfer_func_predefined {
>>         TRANSFER_FUNCTION_GAMMA26
>>  };
>>
>> -
>>  struct dc_transfer_func {
>>         struct kref refcount;
>>         enum dc_transfer_func_type type;
>> @@ -770,7 +765,6 @@ struct dc_transfer_func {
>>         };
>>  };
>>
>> -
>>  union dc_3dlut_state {
>>         struct {
>>                 uint32_t initialized:1;         /*if 3dlut is went through color module for initialization */
>> @@ -784,7 +778,6 @@ union dc_3dlut_state {
>>         uint32_t raw;
>>  };
>>
>> -
>>  struct dc_3dlut {
>>         struct kref refcount;
>>         struct tetrahedral_params lut_3d;
>> @@ -1014,7 +1007,6 @@ enum dc_status dc_validate_global_state(
>>                 struct dc_state *new_ctx,
>>                 bool fast_validate);
>>
>> -
>>  void dc_resource_state_construct(
>>                 const struct dc *dc,
>>                 struct dc_state *dst_ctx);
>> @@ -1167,7 +1159,6 @@ struct dc_container_id {
>>         unsigned short productCode;
>>  };
>>
>> -
>>  struct dc_sink_dsc_caps {
>>         // 'true' if these are virtual DPCD's DSC caps (immediately upstream of sink in MST topology),
>>         // 'false' if they are sink's DSC caps
>> @@ -1229,7 +1220,6 @@ struct dc_cursor {
>>         struct dc_cursor_attributes attributes;
>>  };
>>
>> -
>>  /*******************************************************************************
>>   * Interrupt interfaces
>>   ******************************************************************************/
>> --
>> 2.25.1
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
