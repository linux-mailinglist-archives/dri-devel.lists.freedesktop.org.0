Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B24C211DF50
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 09:22:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6F66E297;
	Fri, 13 Dec 2019 08:22:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7AE886E079
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 17:34:33 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 0666280C0;
 Thu, 12 Dec 2019 17:35:11 +0000 (UTC)
Date: Thu, 12 Dec 2019 09:34:30 -0800
From: Tony Lindgren <tony@atomide.com>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH] ARM: dts: am335x-evmsk: Use drm simple-panel instead of
 tilcdc-panel
Message-ID: <20191212173430.GD35479@atomide.com>
References: <20191204105554.14212-1-jsarha@ti.com>
 <1aa8c476-031a-e156-7648-c9740a98e3ee@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1aa8c476-031a-e156-7648-c9740a98e3ee@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Fri, 13 Dec 2019 08:22:24 +0000
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tomi.valkeinen@ti.com, Jyri Sarha <jsarha@ti.com>, bcousson@baylibre.com,
 linux-omap@vger.kernel.org, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Peter Ujfalusi <peter.ujfalusi@ti.com> [191204 11:26]:
> 
> 
> On 04/12/2019 12.55, Jyri Sarha wrote:
> > Move to use the new drm panel support in tilcdc together with added
> > "newhaven,nhd-4.3-480272ef-atxl"-panel support in drm panel-simple.
> 
> Tested-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

Thanks applying into omap-for-v5.6/dt.

Tony
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
