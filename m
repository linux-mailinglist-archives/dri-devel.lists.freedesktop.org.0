Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7574E89C8
	for <lists+dri-devel@lfdr.de>; Sun, 27 Mar 2022 21:38:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB4810E78F;
	Sun, 27 Mar 2022 19:38:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7341D10E78F
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Mar 2022 19:38:13 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 706f5c1a-ae05-11ec-9ac0-0050568cd888;
 Sun, 27 Mar 2022 19:38:12 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 2BB79194B68;
 Sun, 27 Mar 2022 21:38:11 +0200 (CEST)
Date: Sun, 27 Mar 2022 21:38:07 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Christophe Branchereau <cbranchereau@gmail.com>
Subject: Re: [PATCH v5 2/3] drm/panel: Add panel driver for NewVision NV3052C
 based LCDs
Message-ID: <YkC9H7Gap3vCv6Bz@ravnborg.org>
References: <20220321133651.291592-1-cbranchereau@gmail.com>
 <20220321133651.291592-3-cbranchereau@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220321133651.291592-3-cbranchereau@gmail.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christophe

On Mon, Mar 21, 2022 at 02:36:50PM +0100, Christophe Branchereau wrote:
> This driver supports the NewVision NV3052C based LCDs. Right now, it
> only supports the LeadTek LTK035C5444T 2.4" 640x480 TFT LCD panel, which
> can be found in the Anbernic RG-350M handheld console.
> 
> Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
Please add:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

from the previous review round.

	Sam
