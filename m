Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B36722355
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 12:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB9510E1BB;
	Mon,  5 Jun 2023 10:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0421410E27D
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 10:23:27 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:f07e:6d89:4e02:be9])
 by laurent.telenet-ops.be with bizsmtp
 id 5NPP2A00940Pbp601NPPs3; Mon, 05 Jun 2023 12:23:24 +0200
Received: from geert (helo=localhost)
 by ramsan.of.borg with local-esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1q67Mx-00BeIq-Qr;
 Mon, 05 Jun 2023 12:23:23 +0200
Date: Mon, 5 Jun 2023 12:23:23 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: linux-kernel@vger.kernel.org
Subject: Re: Build regressions/improvements in v6.4-rc5
In-Reply-To: <20230605101536.1864030-1-geert@linux-m68k.org>
Message-ID: <ef69a925-966e-7c8c-394-5a1d17f87036@linux-m68k.org>
References: <CAHk-=wifuPqAFXQQTTLkp_+FMzxGFHpSG-hEtZazG-46s=noAw@mail.gmail.com>
 <20230605101536.1864030-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 5 Jun 2023, Geert Uytterhoeven wrote:
> JFYI, when comparing v6.4-rc5[1] to v6.4-rc4[3], the summaries are:
>  - build errors: +2/-4

arm64-gcc5/arm64-allmodconfig (seen before)

> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/9561de3a55bed6bdd44a12820ba81ec416e705a7/ (151 out of 152 configs)
> [3] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/7877cb91f1081754a1487c144d85dc0d2e2e7fc4/ (151 out of 152 configs)

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
