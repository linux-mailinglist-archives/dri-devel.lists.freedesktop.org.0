Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C4E319C05
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 10:43:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 254486E55E;
	Fri, 12 Feb 2021 09:43:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0154.hostedemail.com
 [216.40.44.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 715766E0D5;
 Fri, 12 Feb 2021 09:43:10 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id D6A681802913B;
 Fri, 12 Feb 2021 09:43:07 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:800:960:973:988:989:1260:1261:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1537:1566:1593:1594:1711:1714:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3622:3865:3871:3873:3874:4250:4321:5007:7652:10004:10400:10848:11026:11232:11658:11914:12297:12438:12740:12760:12895:13069:13311:13357:13439:14181:14659:14721:21080:21451:21611:21627:30054:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: boats42_271835e27620
X-Filterd-Recvd-Size: 1529
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf14.hostedemail.com (Postfix) with ESMTPA;
 Fri, 12 Feb 2021 09:43:06 +0000 (UTC)
Message-ID: <b58199ccc5f051a5476fc1ae0eb72007030802f6.camel@perches.com>
Subject: Re: [PATCH] drm/msm/dp: Add a missing semi-colon
From: Joe Perches <joe@perches.com>
To: Stephen Boyd <swboyd@chromium.org>, Andrew Morton
 <akpm@linux-foundation.org>, Rob Clark <robdclark@gmail.com>
Date: Fri, 12 Feb 2021 01:43:04 -0800
In-Reply-To: <161281062730.76967.14597290603195200219@swboyd.mtv.corp.google.com>
References: <20210207041858.3317171-1-swboyd@chromium.org>
 <8943f0acd2944144b21b5796c07e79ff5e707aaf.camel@perches.com>
 <161281062730.76967.14597290603195200219@swboyd.mtv.corp.google.com>
User-Agent: Evolution 3.38.1-1 
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, Lee Jones <lee.jones@linaro.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2021-02-08 at 10:57 -0800, Stephen Boyd wrote:
> Quoting Joe Perches (2021-02-06 21:06:54)
> > Wow, that's really unfortunate that dp_panel_update_tu_timings
> > is also void.
> > 
> > Perhaps this as YA checkpatch warning:
> > 
> > ---
> 
> Acked-by: Stephen Boyd <swboyd@chromium.org>

Are you acking the proposed checkpatch patch?

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
