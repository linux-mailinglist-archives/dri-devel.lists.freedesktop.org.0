Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C9127E045
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 07:25:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE516E094;
	Wed, 30 Sep 2020 05:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 577 seconds by postgrey-1.36 at gabe;
 Wed, 30 Sep 2020 05:24:57 UTC
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net
 [83.223.78.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9D126E094
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 05:24:57 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
 by bmailout2.hostsharing.net (Postfix) with ESMTPS id B8B29282269E4;
 Wed, 30 Sep 2020 07:15:16 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 911A422805A; Wed, 30 Sep 2020 07:15:16 +0200 (CEST)
Date: Wed, 30 Sep 2020 07:15:16 +0200
From: Lukas Wunner <lukas@wunner.de>
To: "Roland Scheidegger (VMware)" <rscheidegger.oss@gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Fix error handling in get_node
Message-ID: <20200930051516.GA16013@wunner.de>
References: <20200930040303.1935-1-rscheidegger.oss@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930040303.1935-1-rscheidegger.oss@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: airlied@redhat.com, linux-graphics-maintainer@vmware.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 30, 2020 at 06:03:03AM +0200, Roland Scheidegger (VMware) wrote:
> Sigend-off-by: Roland Scheidegger <sroland@vmware.com>
    ^^^
typo
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
