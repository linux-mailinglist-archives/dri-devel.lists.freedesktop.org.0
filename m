Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A26153FEE
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 09:18:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C4116FA23;
	Thu,  6 Feb 2020 08:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from kvm5.telegraphics.com.au (kvm5.telegraphics.com.au
 [98.124.60.144])
 by gabe.freedesktop.org (Postfix) with ESMTP id E40766E25C
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 22:18:23 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id D532529A90;
 Wed,  5 Feb 2020 17:18:22 -0500 (EST)
Date: Thu, 6 Feb 2020 09:18:21 +1100 (AEDT)
From: Finn Thain <fthain@telegraphics.com.au>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 1/3] fbdev/g364fb: Fix build failure
In-Reply-To: <08447d52-0007-6f68-3848-209295a61d13@amsat.org>
Message-ID: <alpine.LNX.2.22.394.2002060918030.8@nippy.intranet>
References: <cover.1580610812.git.fthain@telegraphics.com.au>
 <d8f19ebc00a7688da739d41d584d081d1559f0d2.1580610812.git.fthain@telegraphics.com.au>
 <CAAdtpL7SpzfqSmEcuVszNyXfrRegC20txoS5j7Ss3WkCmyRH+g@mail.gmail.com>
 <08447d52-0007-6f68-3848-209295a61d13@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463811774-850924153-1580941101=:8"
X-Mailman-Approved-At: Thu, 06 Feb 2020 08:17:51 +0000
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
Cc: linux-fbdev@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Burton <paulburton@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 James Hogan <jhogan@kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Thomas Bogendoerfer <tbogendoerfer@suse.de>, dri-devel@lists.freedesktop.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-850924153-1580941101=:8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 5 Feb 2020, Philippe Mathieu-Daud=C3=A9 wrote:

> Note, you need to rebase your series due to:
>=20
>   commit 8a48ac339398f21282985bff16552447d41dcfb2
>   Author: Jani Nikula <jani.nikula@intel.com>
>   Date:   Tue Dec 3 18:38:50 2019 +0200
>=20
>       video: constify fb ops across all drivers
>=20

OK.

Thanks for your review.
---1463811774-850924153-1580941101=:8
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

---1463811774-850924153-1580941101=:8--
