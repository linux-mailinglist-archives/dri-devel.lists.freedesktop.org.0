Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A02214F15D
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 18:35:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 673906E226;
	Fri, 31 Jan 2020 17:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 556 seconds by postgrey-1.36 at gabe;
 Fri, 31 Jan 2020 17:35:46 UTC
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCD46E226
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 17:35:46 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2005)
 id 33A8A68B20; Fri, 31 Jan 2020 18:26:27 +0100 (CET)
Date: Fri, 31 Jan 2020 18:26:26 +0100
From: Torsten Duwe <duwe@lst.de>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel@ffwll.ch>
Subject: Reminder: pending DRI fixes for analogix bridges
Message-ID: <20200131172626.GA24941@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

I'm still not sure about your release and merge cycles, but it looks
like these fixes got dropped:

https://patchwork.freedesktop.org/patch/343003

https://patchwork.freedesktop.org/patch/343004

https://patchwork.freedesktop.org/patch/343005

The erroneous code is in drm-misc-next for quite some time now.
Please apply above fixes before the code hits mainline.
Thanks,

	Torsten
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
