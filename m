Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F9A11C8B2
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 09:56:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D260B6ECE0;
	Thu, 12 Dec 2019 08:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7AC656E878
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 16:51:56 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 63C4480FA;
 Wed, 11 Dec 2019 16:52:34 +0000 (UTC)
Date: Wed, 11 Dec 2019 08:51:52 -0800
From: Tony Lindgren <tony@atomide.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/3] ARM: dts: am437x-gp/epos-evm: fix panel compatible
Message-ID: <20191211165152.GB43123@atomide.com>
References: <20191114093950.4101-1-tomi.valkeinen@ti.com>
 <20191114093950.4101-2-tomi.valkeinen@ti.com>
 <20191202130129.GG4929@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191202130129.GG4929@pendragon.ideasonboard.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Thu, 12 Dec 2019 08:55:06 +0000
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
Cc: devicetree@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Laurent Pinchart <laurent.pinchart@ideasonboard.com> [191202 13:02]:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Thu, Nov 14, 2019 at 11:39:48AM +0200, Tomi Valkeinen wrote:
> > The LCD panel on AM4 GP EVMs and ePOS boards seems to be
> > osd070t1718-19ts. The current dts files say osd057T0559-34ts. Possibly
> > the panel has changed since the early EVMs, or there has been a mistake
> > with the panel type.
> > 
> > Update the DT files accordingly.
> > 
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> 
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Applying this one into fixes thanks.

Regards,

Tony
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
