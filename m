Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FD35622AB
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 21:10:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6A1113D7A;
	Thu, 30 Jun 2022 19:10:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747D611A113
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 19:10:01 +0000 (UTC)
Received: from [192.168.1.107] ([37.4.249.155]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MFb38-1nqzvj0lQs-00H6Lf; Thu, 30 Jun 2022 21:09:53 +0200
Message-ID: <7da6bab5-4b0f-0688-49f4-e4bc060eab61@i2se.com>
Date: Thu, 30 Jun 2022 21:09:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [next] Rpi4 : WARNING: at drivers/gpu/drm/vc4/vc4_hdmi_regs.h:487
 vc5_hdmi_reset+0x1f0/0x240 [vc4]
Content-Language: en-US
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 linux-rpi-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <CA+G9fYve16J7=4f+WAVrTUspxkKA+3BonHzGyk8VP=U+D9irOQ@mail.gmail.com>
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <CA+G9fYve16J7=4f+WAVrTUspxkKA+3BonHzGyk8VP=U+D9irOQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:7hR/6bI8l+kCRZu2Vl+1sSQPLOYu4+kdZLD1w3dITVcjJ3w+IOG
 4XWRCHjhYpeq3E1VpaU+p7KzUCFB2MV/8DT83FQetYrWMo0xj8sNA61hpPKwWJbztdk3i6C
 yK1vKY0HkOxiIJMIpWnWvL1pcL3Ex7BU5/4EyrskmBVmQ3BAelnxNJkH5ZaoqFb+Ysfr96f
 HVAf7mZHNxx7WJCS9gwCg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rmA2zA5k6Ns=:/TPiifGb2YcMdLUrOcgcvo
 pzyJz871ByW0rlg1/r+9yaJ4nzaa10zbm9tme+pX0eEEVAt7Zdxf3+0tBL/1833hk2kGoKMkc
 F5Pa0KU48sA8aal7d9lbPlf41zXG2y76baZEtU3RqxeLOv2pX7f2kcklF+oPla9TgLOt6k3CY
 iVTKtrFMwVIs1qPOs6MedHeAREQ+HgPI1ZcZlB/HVsY3smHEILfhZc8A1EVLg65H7wiFEBlwl
 k2xEC8KEk4bK7ewIuVc6Nc5poKGNuUjeWwyGWvRZsaRG+TvNuhLud6y6VSlATBbbVTkjsjrTN
 zv3lbBpqKYhXbgUZHg52n3N+1kmMjkQ5wWjAhi7CxFA8icsgBpp+6KqsXwTpE0DTaP/nzSMV+
 GtGyEtrCZUhw+hqzIAWuX3U7qkS2E8pCtJPpbYFB+DV+sBbusS9AknvMMmhBL5tGD0dRXfhYh
 4gNVs+J939k9l+6neFflSCzzP5vLobWxPwo4+hJlnmmw7fR7Bt4SHoM1aAzshdoBc2ZgkIXUD
 AXPOCdFIP6FCbuuE/z/2NuMhAHjj1wW6+AdsJLZ0C+PsBijyBfvZM3Wq+Up9BiZ5FBM2FvRnk
 Xnyi88lmkO3FkZp7efTebLpQ+qAMFo4s8eNa718d23QyZ6zr6JvxSG528zJzLBOfTAizwCQPx
 QhW+YIXJnSC27so02heGVgOMnz+RyIfh7f7X79Nj+/C+C9Jsoga0ZnaTFGxEMMoXMQbdQnEtN
 D4ICTRsYxt4X+N5c+o1jmdsz5k1eddIKhRn1q0cEpd2VNgi9UzFJQpt5Xy0=
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
Cc: Emma Anholt <emma@anholt.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Naresh,

thanks for your report.

Am 30.06.22 um 18:11 schrieb Naresh Kamboju:
> The following kernel warning found on Rpi4 while booting linux next-20220630.
> Boot log details [1] & [2].

i think this is related to this:

https://lists.freedesktop.org/archives/dri-devel/2022-June/362244.html

>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd083]
> [    0.000000] Linux version 5.19.0-rc4-next-20220630
> (tuxmake@tuxmake) (aarch64-linux-gnu-gcc (Debian 11.3.0-3) 11.3.0, GNU
> ld (GNU Binutils for Debian) 2.38) #1 SMP PREEMPT @1656576657
> [    0.000000] Machine model: Raspberry Pi 4 Model B
> <trim>
> [   21.702341] vc4-drm gpu: [drm] Couldn't stop firmware display driver: -22
> [   21.711580] vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
> [   21.719271] ------------[ cut here ]------------
> [   21.723971] WARNING: CPU: 0 PID: 246 at
> drivers/gpu/drm/vc4/vc4_hdmi_regs.h:487 vc5_hdmi_reset+0x1f0/0x240
> [vc4]
> [   21.734403] Modules linked in: cfg80211(+) raspberrypi_hwmon
> clk_raspberrypi bluetooth reset_raspberrypi crct10dif_ce vc4(+) cec
> drm_display_helper rfkill iproc_rng200 drm_cma_helper drm_kms_helper
> pwm_bcm2835 i2c_bcm2835 rng_core v3d bcm2711_thermal drm_shmem_helper
> gpu_sched pcie_brcmstb drm fuse
> [   21.761318] CPU: 0 PID: 246 Comm: systemd-udevd Not tainted
> 5.19.0-rc4-next-20220630 #1
> [   21.769445] Hardware name: Raspberry Pi 4 Model B (DT)
> [   21.774656] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   21.781725] pc : vc5_hdmi_reset+0x1f0/0x240 [vc4]
> [   21.786587] lr : vc5_hdmi_reset+0x38/0x240 [vc4]
> [   21.791356] sp : ffff80000b533630
> [   21.794715] x29: ffff80000b533630 x28: 0000000000000000 x27: ffff0000411d4080
> [   21.801967] x26: 0000000000000000 x25: ffff800009cdd980 x24: ffff80000ae15410
> [   21.809218] x23: ffff000040fce000 x22: ffff0000fb83a978 x21: 0000000000000000
> [   21.816467] x20: ffff0000411d4cf0 x19: ffff0000411d4080 x18: 0000000000000000
> [   21.823716] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
> [   21.830963] x14: 0000000000000000 x13: 0000000000000030 x12: 0101010101010101
> [   21.838211] x11: 7f7f7f7f7f7f7f7f x10: ffff84000386a50f x9 : ffff8000093b1660
> [   21.845460] x8 : 0101010101010101 x7 : 0000000000000000 x6 : 0000000000000001
> [   21.852709] x5 : ffff80000a9bf2e0 x4 : ffff80000a9bf000 x3 : 0000000000000000
> [   21.859958] x2 : 0000000000000001 x1 : 0000000000000002 x0 : ffff800001587ae8
> [   21.867207] Call trace:
> [   21.869684]  vc5_hdmi_reset+0x1f0/0x240 [vc4]
> [   21.874188]  vc4_hdmi_runtime_resume+0x74/0xb0 [vc4]
> [   21.879308]  vc4_hdmi_bind+0x22c/0x880 [vc4]
> [   21.880064] cfg80211: Loading compiled-in X.509 certificates for
> regulatory database
> [   21.883719]  component_bind_all+0x130/0x290
> [   21.883747]  vc4_drm_bind+0x19c/0x2a4 [vc4]
> [   21.900105]  try_to_bring_up_aggregate_device+0x1f8/0x300
> [   21.905597]  component_master_add_with_match+0xbc/0x104
> [   21.910910]  vc4_platform_drm_probe+0xcc/0x10c [vc4]
> [   21.916028]  platform_probe+0x74/0xf0
> [   21.919750]  really_probe+0xc8/0x3e0
> [   21.923385]  __driver_probe_device+0x84/0x190
> [   21.927811]  driver_probe_device+0x44/0x100
> [   21.932062]  __driver_attach+0xd8/0x210
> [   21.935959]  bus_for_each_dev+0x7c/0xe0
> [   21.939857]  driver_attach+0x30/0x3c
> [   21.943489]  bus_add_driver+0x188/0x244
> [   21.947384]  driver_register+0x84/0x140
> [   21.951282]  __platform_driver_register+0x34/0x40
> [   21.956055]  vc4_drm_register+0x5c/0x1000 [vc4]
> [   21.960730]  do_one_initcall+0x50/0x2b0
> [   21.964628]  do_init_module+0x50/0x200
> [   21.968440]  load_module+0x1a8c/0x1f40
> [   21.972243]  __do_sys_finit_module+0xac/0x12c
> [   21.976663]  __arm64_sys_finit_module+0x2c/0x40
> [   21.981259]  invoke_syscall+0x50/0x120
> [   21.985069]  el0_svc_common.constprop.0+0x104/0x124
> [   21.990024]  do_el0_svc+0x3c/0xd0
> [   21.993392]  el0_svc+0x38/0xc0
> [   21.996494]  el0t_64_sync_handler+0xbc/0x140
> [   22.000828]  el0t_64_sync+0x18c/0x190
> [   22.004544] ---[ end trace 0000000000000000 ]---
> [   22.009327] ------------[ cut here ]------------
> [   22.014009] WARNING: CPU: 0 PID: 246 at
> drivers/gpu/drm/vc4/vc4_hdmi_regs.h:457 vc4_hdmi_read+0xec/0x134 [vc4]
> [   22.024243] Modules linked in: cfg80211(+) raspberrypi_hwmon
> clk_raspberrypi bluetooth reset_raspberrypi crct10dif_ce vc4(+) cec
> drm_display_helper rfkill iproc_rng200 drm_cma_helper drm_kms_helper
> pwm_bcm2835 i2c_bcm2835 rng_core v3d bcm2711_thermal drm_shmem_helper
> gpu_sched pcie_brcmstb drm fuse
> [   22.051149] CPU: 0 PID: 246 Comm: systemd-udevd Tainted: G        W
>          5.19.0-rc4-next-20220630 #1
> [   22.060684] Hardware name: Raspberry Pi 4 Model B (DT)
> [   22.065894] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   22.072959] pc : vc4_hdmi_read+0xec/0x134 [vc4]
> [   22.077631] lr : vc5_hdmi_reset+0xac/0x240 [vc4]
>
> metadata:
>    git_ref: master
>    git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>    git_sha: 6cc11d2a1759275b856e464265823d94aabd5eaf
>    git_describe: next-20220630
>    kernel_version: 5.19.0-rc4
>    kernel-config: https://builds.tuxbuild.com/2BHwwIpQQ4jA4OQSp6ecOQNPxTg/config
>    build-url: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/-/pipelines/576712449
>    artifact-location: https://builds.tuxbuild.com/2BHwwIpQQ4jA4OQSp6ecOQNPxTg
>    toolchain: gcc-11
>
> [1] https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20220630/testrun/10438428/suite/log-parser-boot/tests/
> [2] https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20220630/testrun/10438428/suite/log-parser-boot/test/check-kernel-exception-5227708/details/
>
> --
> Linaro LKFT
> https://lkft.linaro.org
>
> _______________________________________________
> linux-rpi-kernel mailing list
> linux-rpi-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rpi-kernel
