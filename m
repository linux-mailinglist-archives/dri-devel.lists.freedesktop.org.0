Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6481804D7
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 18:31:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 859F26E35D;
	Tue, 10 Mar 2020 17:31:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A136E35D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 17:31:47 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 012AD80518;
 Tue, 10 Mar 2020 18:31:42 +0100 (CET)
Date: Tue, 10 Mar 2020 18:31:41 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm: panel: Set connector type for OrtusTech
 COM43H4M85ULC panel
Message-ID: <20200310173141.GA3785@ravnborg.org>
References: <20200309184210.10042-1-laurent.pinchart@ideasonboard.com>
 <20200309190047.GA7543@ravnborg.org>
 <20200309190127.GB4916@pendragon.ideasonboard.com>
 <20200309194541.GA8617@ravnborg.org>
 <20200309202942.GD4916@pendragon.ideasonboard.com>
 <20200309212251.GZ13686@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200309212251.GZ13686@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=lxbe0rVFdI73sv45yGUA:9 a=CjuIK1q_8ugA:10
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
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ville.

> > > 
> > > My lame and simple workflow
> > > 
> > > dim update-branches
> > > # save patch from mutt
> > > cat mbox | dim apply
> 
> Why don't you just pipe the thing into dim straight from mutt?
> That's what I do. Followed by some amount of dim extract-tag
> also piped in from mutt.

Because you did not tell me this was possible :-)
So I just tried '|' dim apply - it worked like wonders.
Thanks!

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
