Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 185B9561E60
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 16:46:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB19811BA8E;
	Thu, 30 Jun 2022 14:46:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC20811B9EA
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 14:46:50 +0000 (UTC)
Received: from [192.168.1.107] ([37.4.249.155]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MLz3R-1oOJhV3iF7-00Hspo; Thu, 30 Jun 2022 16:46:44 +0200
Message-ID: <dfbc0c61-c87e-743b-cf79-b57c7321143d@i2se.com>
Date: Thu, 30 Jun 2022 16:46:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: drm-misc-next: WARNING: at drivers/gpu/drm/vc4/vc4_hdmi_regs.h:487
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <179330ab-951b-d9cd-bf73-a80fbc5666d9@i2se.com>
 <20220630073750.cjsskqq6bid7ayhf@houat>
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20220630073750.cjsskqq6bid7ayhf@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:TezPKN58sXw5/uOw0t8WoO/WCoX/sxE7N4H19rcyo/TvFaI8ii1
 gwyA5rkaj8loyqnjJmlLnt3WDocKYIdeoG9OZPP6Jn+/2gPnYZTSPm1dcIijOpuqDgGZQCP
 oc3xi6/dOfC2dNmbS/o70IStm0w4Dgw3tsDVD0p+IxgvyYB3y1w54IqHMMFaTCduZvcvraR
 zlQuiYNvP8DSpv3pPv0FA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Gw+lDkRSCqU=:uuvOWsPlQgVohwgVLwym5o
 yv3kWWV7ykQoHBNG0Tv/puMfQSndHtV1Y8PBL5KMl/Z3inzmb82DKJiWmufnPRcbHjHZa8MBz
 CasSYSt0u2ENtpKyL1kth+UEWKX3+y/JUMHqoNq2GQBDmMA8+U/LJRZEGUmfgf7H0Er7jBsa1
 FMNw2DOAprqoxAlFiFJNByQnPdCNUrq+WEXYW5lEpcq1NOZ6j/ku0wKFZLMIqmbB+JcfqRb5Y
 nHJ5ZdLOUOD1Yso56TJVVZ7I1EtW29TPOzo3979plYFsXtGWx3qB7qh4MdmLntpgkRgqJfyiP
 gaBCRLF91g+tJFhGkl3uCc2a98MEt0qHrNK1El823YpbHWSyd5UHVxjfbhyl6d+nTpCPlgXYL
 mV+f7AI+4RiNp+7ZObsqEsYxTG7YYv89Ovr6e7ffOC75+bEjsbMrMgX82eWMWZlgiubOFZ0ce
 U8NYZL9XOjVgS3Mfrm5Al45PUH/hYW94yMGfZGPshPM/FlGOz1in8eioMBR1X3vYZ1JYBm4d3
 4Hrp8ndraQhCD8hnxH+Q7v3VxzXr/TuDiLtZH/v2BeTsE9oF6ss5V9zoj+LW2K5/+ozIPeO9y
 V/aq2/PgdS6uOWDXExu5kJY7Vrm55N0CS1rkUY9txZOxHczIOLNO6INMSKASvlxepVu9VJJvJ
 G8H8R9h3o5VtNbo1mfA9y3r88s3UBgwrdpxU0jgJjMSRSFyKv6Lw+BxEwNgePgLfqELEYAafl
 6Py62Xs3N4oow2nVOkJKUIX8e13J5gUuRb/yr7vTkBCjrkv1gKmBFa3FjMs=
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

Am 30.06.22 um 09:37 schrieb Maxime Ripard:
> Hi Stefan,
>
> On Wed, Jun 29, 2022 at 10:50:21PM +0200, Stefan Wahren wrote:
>> Hi Maxime,
>>
>> i tested todays drm-misc-next 9db35bb349 with Raspberry Pi 3 B Plus
>> (arm/multi_v7_defconfig, mainline DTB) and get the following warning in the
>> kernel logs:
>>
>> [   25.698459] vc4-drm soc:gpu: bound 3f400000.hvs (ops vc4_hvs_ops [vc4])
>> [   25.698657] ------------[ cut here ]------------
>> [   25.698660] WARNING: CPU: 1 PID: 153 at
>> drivers/gpu/drm/vc4/vc4_hdmi_regs.h:487 vc4_hdmi_reset+0x3e0/0x4e0 [vc4]
>> [   25.698757] Modules linked in: brcmutil vc4(+) snd_soc_core ac97_bus
>> sha256_generic libsha256 snd_pcm_dmaengine sha256_arm snd_pcm cfg80211
>> snd_timer hci_uart btbcm snd soundcore bluetooth raspberrypi_hwmon
>> drm_cma_helper ecdh_generic ecc libaes bcm2835_thermal microchip lan78xx
>> crc32_arm_ce
>> [   25.698831] CPU: 1 PID: 153 Comm: systemd-udevd Not tainted
>> 5.19.0-rc2-00085-g9db35bb349a0 #2
>> [   25.698839] Hardware name: BCM2835
>> [   25.698850]  unwind_backtrace from show_stack+0x10/0x14
>> [   25.698866]  show_stack from dump_stack_lvl+0x40/0x4c
>> [   25.698879]  dump_stack_lvl from __warn+0xcc/0x144
>> [   25.698890]  __warn from warn_slowpath_fmt+0x5c/0xb4
>> [   25.698900]  warn_slowpath_fmt from vc4_hdmi_reset+0x3e0/0x4e0 [vc4]
>> [   25.698996]  vc4_hdmi_reset [vc4] from vc4_hdmi_runtime_resume+0x4c/0x64
>> [vc4]
>> [   25.699165]  vc4_hdmi_runtime_resume [vc4] from vc4_hdmi_bind+0x208/0x994
>> [vc4]
>> [   25.699333]  vc4_hdmi_bind [vc4] from component_bind_all+0x100/0x230
>> [   25.699428]  component_bind_all from vc4_drm_bind+0x1a8/0x280 [vc4]
>> [   25.699518]  vc4_drm_bind [vc4] from
>> try_to_bring_up_aggregate_device+0x160/0x1bc
>> [   25.699610]  try_to_bring_up_aggregate_device from
>> component_master_add_with_match+0xc4/0xf8
>> [   25.699622]  component_master_add_with_match from
>> vc4_platform_drm_probe+0xa0/0xc0 [vc4]
>> [   25.699712]  vc4_platform_drm_probe [vc4] from platform_probe+0x5c/0xbc
>> [   25.699802]  platform_probe from really_probe.part.0+0x9c/0x2b0
>> [   25.699812]  really_probe.part.0 from __driver_probe_device+0xa8/0x13c
>> [   25.699823]  __driver_probe_device from driver_probe_device+0x34/0x108
>> [   25.699834]  driver_probe_device from __driver_attach+0xb4/0x17c
>> [   25.699846]  __driver_attach from bus_for_each_dev+0x70/0xb0
>> [   25.699856]  bus_for_each_dev from bus_add_driver+0x164/0x1f0
>> [   25.699867]  bus_add_driver from driver_register+0x88/0x11c
>> [   25.699878]  driver_register from do_one_initcall+0x40/0x1d4
>> [   25.699890]  do_one_initcall from do_init_module+0x44/0x1d4
>> [   25.699901]  do_init_module from sys_finit_module+0xbc/0xf8
>> [   25.699909]  sys_finit_module from __sys_trace_return+0x0/0x10
>> [   25.699918] Exception stack(0xf568dfa8 to 0xf568dff0)
>> [   25.699926] dfa0:                   6a09f700 00000000 00000016 b6dee8e0
>> 00000000 b6def3f4
>> [   25.699934] dfc0: 6a09f700 00000000 00000000 0000017b 0053b9a8 0052a1dc
>> 0053af10 00000000
>> [   25.699940] dfe0: be8e5160 be8e5150 b6de59d8 b6ed5ae0
>> [   25.699944] ---[ end trace 0000000000000000 ]---
>>
>> I was able to bisect the warning to the following commit:
>>
>> drm/vc4: hdmi: Move HDMI reset to pm_resume
>>
>> The BCM2835-37 found in the RaspberryPi 0 to 3 have a power domain
>> attached to the HDMI block, handled in Linux through runtime_pm.
>>
>> That power domain is shared with the VEC block, so even if we put our
>> runtime_pm reference in the HDMI driver it would keep being on. If the
>> VEC is disabled though, the power domain would be disabled and we would
>> lose any initialization done in our bind implementation.
>>
>> That initialization involves calling the reset function and initializing
>> the CEC registers.
>>
>> Let's move the initialization to our runtime_resume implementation so
>> that we initialize everything properly if we ever need to.
>>
>> Fixes: c86b41214362 ("drm/vc4: hdmi: Move the HSM clock enable to
>> runtime_pm")
>> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>> Link: https://lore.kernel.org/r/20220613144800.326124-24-maxime@cerno.tech
>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> Yeah, I noticed it yesterday
>
> https://lore.kernel.org/dri-devel/20220629123510.1915022-1-maxime@cerno.tech/T/#m1027cef33d8c66a302b2b8a80bab8a9dc6652f04
>
> and
>
> https://lore.kernel.org/dri-devel/20220629123510.1915022-1-maxime@cerno.tech/T/#mc869819c66f7b3df8b31a320636a9172780a58e7
>
> Should address it

i applied them and it fixed the issue on the Raspberry Pi 3 B Plus.

You can have

Tested-by: Stefan Wahren <stefan.wahren@i2se.com>

for both of them.

Btw i noticed that the offending patch introduced a #ifdef block within 
the code. AFAIK this is undesirable. Should i send i patch?

Best regards

>
> Maxime
