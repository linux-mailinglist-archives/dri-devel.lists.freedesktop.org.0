Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 547E735B805
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 03:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE3E89CB5;
	Mon, 12 Apr 2021 01:18:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A3889CB5
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 01:18:26 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id a1so13361030ljp.2
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Apr 2021 18:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=bWXzFBc//kA+mD6Xu+Z8x25DUoImUjQAGDvbVQnMwWA=;
 b=hyfpdNrhnFuxtbe264O1+oJnXJXVznNSlnyVbTFxM7FKfZdjFE5/AbydK4H+XwJMn8
 3m2DG1B7aCyA397niFI1VF1+zntMCXiQb0U1Lnv+JROGUBxCa81tlmVz5Vc8wN38VoUL
 1VorZIRmHZFEvv8Z/V6p1AGqSXO0AmvbsPZFnQWpdnPa4CG0zjx24rietrdK/hrWXUM6
 zLc5nOLpoFM1q0QuhJytTYSgN985Nwof4r8wFUeoaJIhB3lm5qKBiw85M2G7eC7A7N9u
 CeHDQcUlmxHQFplDkg3IF1Lji3AWL01iOhxeNzeVZy882NgvI5/2aKu/ExS8H4iqYNbf
 kiTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=bWXzFBc//kA+mD6Xu+Z8x25DUoImUjQAGDvbVQnMwWA=;
 b=NuB8gvSqjDU5IcG3kAFqrArkvX6QRVeUUjH/qpt8B9QLI3gUL6kMVyYWE1UZHaQ2QV
 eDPNIDGxsP0A4TdxbWkIvM/JbC9nR2kU7hrDiJpYGXQfVwn+8lEBfmoPYHfObc1DfsAa
 AhdzwXb85AKnjxc7pF4rwt/VBqF0F+BNVxwWfXiod54wl2Oinh5D3WDqFD9yiBADtYR9
 qEgLMrTPVVUqq8U/IyO/SSjfP5VDkXMIwDoozaVOKqcCUGtcAoFyIO0PM01DLK6vjYZN
 TRiCg+Rdmd0pGrd4TbOEDKQD7BdPQmk7ljFdZsJm34Yx4kGDfw0yso3AiGvkt4aTX7su
 omRw==
X-Gm-Message-State: AOAM5319+nwtJuni6nCdVXViEDJGHvhkA3MZal37Uh75Ma8p3gI7gGMC
 5/rZlTN+kSrxevjjwRjUOBhit1oyUsKL0gqonGxkYxVz66y/1A==
X-Google-Smtp-Source: ABdhPJwJXBi2jrn3tiX8AOOxLJ2hj4KD8vDZj9GqMb67z5f661MtLIJ7MgowX1PO132BXj7/marq2D/H5Jp7KTsnRto=
X-Received: by 2002:a05:651c:543:: with SMTP id
 q3mr8661058ljp.46.1618190304853; 
 Sun, 11 Apr 2021 18:18:24 -0700 (PDT)
MIME-Version: 1.0
From: o1bigtenor <o1bigtenor@gmail.com>
Date: Sun, 11 Apr 2021 20:17:49 -0500
Message-ID: <CAPpdf5-WCKbuoqhJkg8vahVQirdzmSUzA5JydT0SKjxTY+mCAA@mail.gmail.com>
Subject: Request for assistance
To: dri-devel@lists.freedesktop.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Greetings

I'm running a Debian testing (11) system using Nouveau as a driver for
2 graphics cards: 1. Nvidia 1050 Ti (GP107) and a Nvidia 570 (GF110)
driving 5 monitors 1 - 3840x2160 and 4 - 1920x1080s.

The 5th monitor was added some about 8 weeks ago and since life got
interesting. Previously I would use an uptime that would last anywhere
from 4 to 6 months but after adding the 5th monitor - - - well the
best has been some few days and the worst - - - a few hours.

I starting digging to try and find possible issues. First thing I
found was the idea of adding firmware which was an interesting
exercise but was successful and now somewhere between 400 and 700
seconds after reboot I'm seeing this:
[  534.790587] nouveau 0000:02:00.0: firmware: direct-loading firmware
nouveau/nvc8_fuc084

I was cheering when I got this far - - - - except this flaw was hiding
another one that I hope you might be able to help with. The error I
see (using dmesg) looks something like this:
[25375.252874] perf: interrupt took too long (3168 > 3150), lowering
kernel.perf_event_max_sample_rate to 63000
[35577.509444] perf: interrupt took too long (3963 > 3960), lowering
kernel.perf_event_max_sample_rate to 50250
[54648.710595] perf: interrupt took too long (4991 > 4953), lowering
kernel.perf_event_max_sample_rate to 40000
[77975.516742] nouveau 0000:01:00.0: fifo: FB_FLUSH_TIMEOUT
[85039.583604] nouveau 0000:01:00.0: DRM: core notifier timeout
[85041.583597] nouveau 0000:01:00.0: DRM: base-0: timeout
[85041.585023] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT
at 690400 [ IBUS ]
[85041.585259] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT
at 616d48 [ IBUS ]
[85043.587213] nouveau 0000:01:00.0: DRM: core notifier timeout
[85045.587202] nouveau 0000:01:00.0: DRM: base-1: timeout
[85047.587302] nouveau 0000:01:00.0: DRM: core notifier timeout
[85049.587289] nouveau 0000:01:00.0: DRM: base-2: timeout
[85051.628464] nouveau 0000:01:00.0: DRM: core notifier timeout
[85053.628538] nouveau 0000:01:00.0: DRM: core notifier timeout
[85085.181271] nouveau 0000:01:00.0: DRM: core notifier timeout
[85087.181829] nouveau 0000:01:00.0: DRM: core notifier timeout
[85089.181909] nouveau 0000:01:00.0: DRM: core notifier timeout

That's the error but here's another data point from early in the boot cycle:
[    1.989397] nouveau 0000:01:00.0: firmware: direct-loading firmware
nvidia/gp107/acr/ucode_unload.bin
[    1.989401] nouveau 0000:01:00.0: pmu: firmware unavailable
[    1.989535] nouveau 0000:01:00.0: firmware: direct-loading firmware
nvidia/gp107/gr/fecs_bl.bin

In digging for what I might be able to do I found this final
communication from late February with a subject line of:
Re: [PATCH v2] drm/nouveau/pmu: fix timeout on GP108

Is what is discussed in this thread the same issue that I'm having on a GP107?

If it is the same issue do I need to apply both of the patches?


(If the answer to the second question is yes how do I apply the patch?
I've found this technique at 'stackoverflow':
1) git clone <path_to_kernel_sources>
2) git checkout 13fac179aa50556ba3c60790a9beb6ca9d0b1b8b
3) git apply <patch_file>

is this the right way to patch the kernel?
(Never done this and really don't need my main computer down for even
hours nevermind weeks.)

Hopefully my explanation is clear enough - - - - if more information
from dmesg files are needed  - - - well I have 5 or 6 to choose from
(called from the second m/c on the network that I reboot the main m/c
from).

TIA
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
