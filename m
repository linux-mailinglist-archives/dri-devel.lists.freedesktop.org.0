Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66536532CC4
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 16:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A5BA10E1A1;
	Tue, 24 May 2022 14:59:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A9FD10E0F8
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 14:59:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 740511F44568
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653404347;
 bh=2v1XmEozL7oSUbTJ0GKuAnaHJIef9ToTFHENZzxZSMo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m3567lSqGv4eYVGfC1nFRndhtOvQvfaSkZCzTS09wkJv4kGcgOlIO2CIVmmzbfW6A
 hBwcKhWUMBXgMBSig4h9G34hOJKXRxxola5XR+lykDzVtJ21TisLkaQ7yhW0T1rD8J
 EiL+ZPM5oLDJkbBXbTzXa4PM8vxRSujjAuMrDPe+pPJ4zzbHLJxUijomu9svL4f+1I
 s+TELtKHbxG5YzNZvNULgvFk+Ji/GE6jAkp/WPS5TjgqtAIU2SVKvGjGm8a0NDHMsR
 WyRvGyx9wk6SFZyd8w17NzGeVdGvoasm8bEHNz+FZAXlwrFlgNnoduAEDqp4BD0DOh
 xDD3RqfxdOeAw==
Date: Tue, 24 May 2022 10:58:59 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] drm/panfrost: Job should reference MMU not file_priv
Message-ID: <Yozys2n+hJmdknfg@maud>
References: <20220519152003.81081-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220519152003.81081-1-steven.price@arm.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
