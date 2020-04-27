Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F551BA6C6
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 16:45:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 622996E2F0;
	Mon, 27 Apr 2020 14:45:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0131.hostedemail.com
 [216.40.44.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B946E2EC
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 14:45:21 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id 925CE181D303C;
 Mon, 27 Apr 2020 14:45:20 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:800:960:966:973:988:989:1260:1277:1311:1313:1314:1345:1359:1431:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2196:2198:2199:2200:2393:2559:2562:2731:2828:3138:3139:3140:3141:3142:3352:3622:3865:3868:3870:3871:4321:4385:5007:6119:7809:8957:10004:10400:10848:11232:11657:11658:11914:12043:12048:12297:12679:12740:12760:12895:13069:13161:13229:13311:13357:13439:14096:14097:14181:14659:14721:21080:21451:21627:30054:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:3, LUA_SUMMARY:none
X-HE-Tag: laugh55_689d99d258c14
X-Filterd-Recvd-Size: 2256
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf13.hostedemail.com (Postfix) with ESMTPA;
 Mon, 27 Apr 2020 14:45:18 +0000 (UTC)
Message-ID: <afe39d6c755dbc0d79e913b531ed12ed94ec1b13.camel@perches.com>
Subject: Re: [PATCH v3 4/4] MAINTAINERS: Add IPK MIPI DSI Host driver entry
From: Joe Perches <joe@perches.com>
To: Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Date: Mon, 27 Apr 2020 07:45:17 -0700
In-Reply-To: <abe4ca0b0662c17212fc5107080e949f1d3377c1.1587992776.git.angelo.ribeiro@synopsys.com>
References: <cover.1587992776.git.angelo.ribeiro@synopsys.com>
 <abe4ca0b0662c17212fc5107080e949f1d3377c1.1587992776.git.angelo.ribeiro@synopsys.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
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
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, David Airlie <airlied@linux.ie>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2020-04-27 at 16:00 +0200, Angelo Ribeiro wrote:
> Creates entry for Synopsys DesignWare IPK DRM driver and
> adds myself as maintainer.
[]
> diff --git a/MAINTAINERS b/MAINTAINERS
[]
> @@ -5507,6 +5507,14 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>  F:	Documentation/devicetree/bindings/display/ste,mcde.txt
>  F:	drivers/gpu/drm/mcde/
>  
> +DRM DRIVER FOR SYNOPSYS DESIGNWARE IPK
> +M:	Angelo Ribeiro <angelo.ribeiro@synopsys.com>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Maintained
> +F:	drivers/gpu/drm/ipk/
> +F:	Documentation/devicetree/bindings/display/ipk/
> +T:	git git://anongit.freedesktop.org/drm/drm-misc

There is now a preferred order for the entries in a section.

Please use:

DRM DRIVER FOR SYNOPSYS DESIGNWARE IPK
M:	Angelo Ribeiro <angelo.ribeiro@synopsys.com>
L:	dri-devel@lists.freedesktop.org>
S:	Maintained
T:	git git://anongit.freedesktop.org/drm/drm-misc
F:	Document
ation/devicetree/bindings/display/ipk/>
F:	drivers/gpu/drm/ipk/


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
