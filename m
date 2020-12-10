Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7E92D5745
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 10:34:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C466EA51;
	Thu, 10 Dec 2020 09:34:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 051AD6EA54
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 09:34:10 +0000 (UTC)
Date: Thu, 10 Dec 2020 09:34:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607592847;
 bh=eTMYBwkr4+lF1LMR5QBHY1fajaQubPDSlFyZoaJj3bo=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=WJLWEukrm5Ic7rry1VAl02wIEtb5Ou4m/2QmKufy6bMYypuZamom4y02/SK3hqTDV
 ake5+JUpDq0Qkt1/yV271VHr1+A8ZqBStjvOGrJgyncHo1u70tWIfVV36rN+BfMctq
 FVCQXrhFVQ5Tn+jEEQSnZB7L9QW7Q/arleeryGaMvcdRSJGFE+giOw0nqsNgq147s7
 ncW4Uedo/gqlTelPkXW7pHa/4JLcWnjqnFExh36y+YwlMmFrOBsKohMMlq3oyWopMo
 JxdcgfjMHFcLS6tUycEyUjAbEulYmp/KoBKooKPE0rmn3Z43V/zl2tGI+gzxd5dERY
 QWTBHDJp12AYg==
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
From: Simon Ser <contact@emersion.fr>
Subject: libdrm commit rights request
Message-ID: <Flhw06CjNijpm6MrrEz900234gKBhcrhb-a095T_WgAIqIWrGPZXl96t5UvcGv1Xi5o8xkDGJDuC76MO8qgWw1sVHK-JQK7eFKKteB_NYEo=@emersion.fr>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Eric Engestrom <eric.engestrom@intel.com>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

I've been contributing to libdrm [1] and core DRM [2] a few patches,
mainly documentation and minor fixes. To continue this effort, I'd like
to request libdrm commit rights. libdrm is the interface user-space
developers will use to interact with the kernel, so I think improving
documentation there and unifying it with the kernel could be
beneficial.

Thanks,

Simon

[1]: https://gitlab.freedesktop.org/mesa/drm/-/commits/master?author=Simon%20Ser
[2]: https://patchwork.freedesktop.org/project/dri-devel/patches/?submitter=17330&q=&archive=&delegate=&state=*
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
