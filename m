Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3142495A0
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 08:57:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D4C26E1F2;
	Wed, 19 Aug 2020 06:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id BBC736E170
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 06:46:31 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 3AE6E807A;
 Wed, 19 Aug 2020 06:46:29 +0000 (UTC)
Date: Wed, 19 Aug 2020 09:46:57 +0300
From: Tony Lindgren <tony@atomide.com>
To: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCHv2 1/4] dt-bindings: display: panel-dsi-cm: convert to YAML
Message-ID: <20200819064657.GW2994@atomide.com>
References: <20200716125733.83654-1-sebastian.reichel@collabora.com>
 <20200716125733.83654-2-sebastian.reichel@collabora.com>
 <20200716175258.GE2235355@ravnborg.org>
 <20200716180710.u6pqe6fvn4usuidf@earth.universe>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200716180710.u6pqe6fvn4usuidf@earth.universe>
X-Mailman-Approved-At: Wed, 19 Aug 2020 06:56:51 +0000
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
Cc: devicetree@vger.kernel.org, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, "H. Nikolaus Schaller" <hns@goldelico.com>,
 Merlijn Wajer <merlijn@wizzup.org>, Rob Herring <robh+dt@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, linux-omap@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Sebastian Reichel <sre@kernel.org> [200716 18:07]:
> On Thu, Jul 16, 2020 at 07:52:58PM +0200, Sam Ravnborg wrote:
> > The DTS file changes needs to go in via another route.
> 
> No worries. I guess Tony will queue them up when he finds some time.

Thanks applying the dts changes into omap-for-v5.10/dt.

Regards,

Tony
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
