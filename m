Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 507DC48EFCC
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 19:18:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0959E10E1A5;
	Fri, 14 Jan 2022 18:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 329 seconds by postgrey-1.36 at gabe;
 Fri, 14 Jan 2022 18:18:10 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E6310E1A5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 18:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642184288;
 bh=BfT+QXQondzq2MdcCIjBYr2wbp9CQ606HkEA+VJrpaM=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=XWT0KIxv9tn11mcObEmkFjLf45hEprad8SPv/Y+jnOeSs1UBdaZ7LgIbFN43nG6fu
 5e/xuZ3i18YGYPoUyH+uD0xyk30eTIBCJNKA0GAJ2AqxQuL/5N2ZykQiEt2armwR5w
 u5dpQ2Ks0c3TDRw34YW6O+le7ZrPR+k3M4YLlbMs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530 ([92.116.186.160]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Ma24s-1mnYAi28xQ-00VzJu; Fri, 14
 Jan 2022 19:12:28 +0100
Date: Fri, 14 Jan 2022 19:11:21 +0100
From: Helge Deller <deller@gmx.de>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
Message-ID: <YeG8ydoJNWWkGrTb@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:U8AySo36viW77ZA+cTW+h6saPqOmnFC3bwCFYOxUzXGXX3knDVl
 i9qqybvIB/2E3qrz8jDtRQdRcAcjEAa05/653by446WEP4yljRIwDQ97ta1w22qoUDefIEW
 YxiYXMZSnScedrA6obPgqq+rL3aA6kWVFpAq1Gw32hMe5ZPPFvBw+xNUozqO2PKPlAhyMVj
 TBzp9LjSUvt6oV+4qz9qw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:AO/+EBCqbEg=:XaOudMzptQJXQQj4e32+vH
 aUyLa5aq1SSdE3mW6gLCjl48GMnx1dc4SQrRJBSfnFGcpo4Jn9jFIoWf1LVhGra6yUGZvnadM
 p/l/JpofLOB4UWh7XliJBWnCkg9ETMqEuQvHwfqudbbHOfVLQFiKPjEr0cT2jVhufdgDFQ/2o
 g8cSLeCIwF9rfleFEx6rWC1h8p15ByOZDmzR7kMduQ/n1tGaISW22ovJMvvS8qcArSe47/2f+
 W3it/+mkt2e4qJ+stqKJ0rLJaO6r878aI5dkSOqXmEatvgEoqEn+5kQzEuKnfSKNpbrdUsu+Z
 rb31eWKA9CpC41ffCKTxSU6VIhq0fVUugiyixxwdkQ/2RZiSClumDuwquQI/VIkQ3mn9q4UYm
 yqN/+0zO9e00rNP7NuD8TfP+N11ax3UJ9/kgmuxTzzq429GBH4mX2vBMAe9iP1isbEoPFLoPL
 PPjBA9cA7K0QfQyw1SDkq+O0KDoRdaUtnPhKjvu4b2z9pe9DabODAPt0iOu5UyC/bn++/Lj+C
 R+HBd0piMNzZVa67SLpgTDsXcpIBbpaYLmn6Kz232m8m20wgCbcYf3YgGzQTTBoBUVyGIViaC
 6fEsYeybCBojc4rPKBxv4QQVxFYeVrYZvqUPoAYaKBq6zpZIgLfjmzLoy1lPgo42rovUSWoP4
 VjUfxlwXwDGuTsEcm/kqVjLvY5KsnzFSKbT+nk8mNwFhasf6v0gH4VUZt24M80I4NguNIwK8y
 WGXNPsZpRLHtwSww6IZ8XxDdOt1K5RlxFnE7AXRVtKwh6Jgf8LC7tIs/CohscJqrpPS8fEBsq
 mvrBowand/bpMp9IAzIAiMRAjFP17KO7fVUBkXAX8XlFZmPeH7wI6EX1sNM07vTQl0SGLCl0a
 AgsTVcxle4HEybAYY5L8bGR+O+GG3GY3bNvPQJEMdVXhXc4a7/ygnJbKiTFSYLC8YJ39fAFfg
 z8PzEt46xWAb4A4ByI0S0zSRiBz1lT3NXARZImA79cqFTAZX4Is81OmRWYjpiJSaKWBlfATVz
 sHMAqbt+xoxvk0FQkQ8ksnxN/FWV2FwcPn0UY31XtBVZ0qqWBiuC//J2W8wal2kAdCAKroPA3
 ASJku3B4Mop3PQ=
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The fbdev layer is orphaned, but seems to need some care.
So I'd like to step up as new maintainer.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/MAINTAINERS b/MAINTAINERS
index 5d0cd537803a..ce47dbc467cc 100644
=2D-- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7583,11 +7583,12 @@ W:	http://floatingpoint.sourceforge.net/emulator/i=
ndex.html
 F:	arch/x86/math-emu/

 FRAMEBUFFER LAYER
-L:	dri-devel@lists.freedesktop.org
+M:	Helge Deller <deller@gmx.de>
 L:	linux-fbdev@vger.kernel.org
-S:	Orphan
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
 Q:	http://patchwork.kernel.org/project/linux-fbdev/list/
-T:	git git://anongit.freedesktop.org/drm/drm-misc
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.g=
it
 F:	Documentation/fb/
 F:	drivers/video/
 F:	include/linux/fb.h
