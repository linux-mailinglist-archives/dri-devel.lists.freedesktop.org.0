Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 531D539061F
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 18:03:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1676EA76;
	Tue, 25 May 2021 16:02:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915CD6EA75;
 Tue, 25 May 2021 16:02:55 +0000 (UTC)
IronPort-SDR: MVNlQiqvmXTwNEeYdQ+nbx0Ai6lAns3pPMwAWnxmqlX4uMF+FeWVG9yOBiak45n95u7eyn0/6W
 jEqk6qhH/zkQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="199174488"
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="199174488"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 09:01:47 -0700
IronPort-SDR: pocfDPH95ToULCU98MGMqUnHvu9B4low/9mtWsx3oTOVbu2OX0xDU4/g1lqA/QWGEzoxz90A8M
 ZJ0yigFG7j1g==
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="442600541"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 09:01:45 -0700
Date: Tue, 25 May 2021 08:54:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 0/3] Clean a few backend interfaces in the i915
Message-ID: <20210525155438.GB6585@sdutt-i7>
References: <20210521183215.65451-1-matthew.brost@intel.com>
 <YK0CKLSCx0qowxhy@phenom.ffwll.local>
 <040887b2-48f3-c4be-2a43-7e99492af5fc@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <040887b2-48f3-c4be-2a43-7e99492af5fc@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 25, 2021 at 04:27:49PM +0100, Tvrtko Ursulin wrote:
> 
> On 25/05/2021 14:56, Daniel Vetter wrote:
> > On Fri, May 21, 2021 at 11:32:12AM -0700, Matthew Brost wrote:
> > > As discussed in [1] start merging some support patches as a precursor to
> > > GuC submission the i915. This is step #1 mentioned in [1].
> > > 
> > > [1] https://patchwork.freedesktop.org/series/89844/
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > Pushed to drm-intel-gt-next, thanks for patches&reviews. Btw you can also
> > ping John H or Daniele for pushing stuff for you, should be quicker than
> > waiting for me to return from a lon w/e :-)
> > 
> > Plus I _really_ don't want to get back into the business of pushing other
> > people's work ...
> 
> To Matt - Also please take care to preserve r-b's when resurrecting patches
> because all of these three had mine from before which is now lost in git
> history.
>

Will do. Still getting used to the upstream rules and wasn't sure if
should have included your old R-Bs.

Matt
 
> Regards,
> 
> Tvrtko
