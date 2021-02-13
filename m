Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DC431AFD7
	for <lists+dri-devel@lfdr.de>; Sun, 14 Feb 2021 10:28:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D076E8B4;
	Sun, 14 Feb 2021 09:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF3D26E89F
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Feb 2021 23:55:02 +0000 (UTC)
Date: Sat, 13 Feb 2021 23:54:49 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: ITE66121 HDMI driver
To: Phong LE <ple@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
Message-Id: <DRRHOQ.EW1770YWN4DN@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 14 Feb 2021 09:28:21 +0000
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
Cc: od@zcrc.me, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Phong and Neil,

I see you sent a patchset to support the ITE66121 HDMI transmitter, 
last version being the V2 back in March 2020.

Do you still plan to mainline it?

I do have a device with a ITE66121 chip, so I can help to clean the 
driver and have it mainlined. But right now I cannot get the driver to 
work, while the chip is properly detected and correct DDC data is 
read,, my PC monitor does not detect any signal.

Cheers,
-Paul


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
