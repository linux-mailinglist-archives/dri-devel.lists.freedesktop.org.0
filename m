Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B1C1D9094
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 09:01:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D186E544;
	Tue, 19 May 2020 07:00:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 546 seconds by postgrey-1.36 at gabe;
 Tue, 19 May 2020 05:32:07 UTC
Received: from berlin.abc-admin.de (berlin.abc-admin.de [62.26.8.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A726E2AF
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 05:32:07 +0000 (UTC)
Received: by berlin.abc-admin.de (Postfix, from userid 641)
 id 2E9C7636EA; Tue, 19 May 2020 07:22:56 +0200 (CEST)
To: dri-devel@lists.freedesktop.org
Subject: =?ISO-8859-1?Q?Graphic card that nee?= =?ISO-8859-1?Q?ds boot
 parameter ?=
X-PHP-Originating-Script: 641:email_neu.php
From: post@hiereth.de
X-Priority: 3
Importance: Normal
X-MSMail-Priority: Normal
X-MimeOLE: Produced by Parallels Confixx WebMail
X-Mailer: Parallels Confixx WebMail (like SquirrelMail)
Cc: 
MIME-Version: 1.0
Message-Id: <20200519052256.2E9C7636EA@berlin.abc-admin.de>
Date: Tue, 19 May 2020 07:22:56 +0200 (CEST)
X-Mailman-Approved-At: Tue, 19 May 2020 07:00:27 +0000
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

Hello,

in
https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html
You ask
to inform about hardware that requires the setting
i915.invert-brightness=1.

I needed this for an quite old notebook with the following
specifications

  lspci -s 00:02 -nn
  00:02.0 VGA compatible controller [0300]: Intel Corporation Mobile
  915GM/GMS/910GML Express Graphics Controller [8086:2592] (rev 03)
  00:02.1 Display controller [0380]: Intel Corporation Mobile
915GM/GMS/910GML
  Express Graphics Controller [8086:2792] (rev 03)

Feel free to request additional information if need. Thanks for your
work on the linux
kernel and the respective documentation

Best regards
Markus Hiereth

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
