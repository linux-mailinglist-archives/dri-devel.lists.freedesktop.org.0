Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA632AF9AA9
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 20:26:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1470610EA52;
	Fri,  4 Jul 2025 18:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CSK5omIH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25AA810E09B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 18:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751653580; x=1783189580;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ipbT/QnTBUeVAy6M/JFK1jDQZRfz8BWcFfq/b7kFN+E=;
 b=CSK5omIHyKmAfukwrDCXCNwXAMg50bh8JsV97qcS1S//HJ4PdK0xNUSr
 8EKfMwYplOxHd7+hA7qc9XJ1vExpulsxC4MdFvRo+/hEeoSbuBV6N6O8/
 pfAo4aU7rzqnZ83eZbXz0kWcWCoUjhU+jQbrQfmQUBgLWTgTU3IUrmDTv
 Nzn4VjGmp1NXPd4TF9xx1CcaBv9fVwi0/muWx6b65h2ewYNTMp5NfL+nj
 Wq3gcs87AMcr2TKQGpxqSAnva9ueY9K8EBSnidiafnRIuY8OEBAhCMfJJ
 BNQ/2YVcVuLvyxMK2NCa/hq4ZrviAgDcSPM18EahNpcUkaVrRW4a095eX g==;
X-CSE-ConnectionGUID: 3l2oKvkhS2eU8K/btD4FYA==
X-CSE-MsgGUID: GOhMP3bvRfmqezvjEeCpSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="76536500"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="76536500"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 11:26:20 -0700
X-CSE-ConnectionGUID: nkFlUfNPSamRutD/MNS/mg==
X-CSE-MsgGUID: +pw7iWkBSmuuwv5dBLym0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; d="scan'208";a="154780787"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 11:26:17 -0700
Date: Fri, 4 Jul 2025 21:26:14 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: simona@ffwll.ch, Krzysztof Karas <krzysztof.karas@intel.com>,
 airlied@gmail.com, Linux Next Mailing List <linux-next@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Stephen Rothwell <sfr@canb.auug.org.au>, kernel-dev@igalia.com
Subject: Re: [PATCH v3 1/3] drm/doc: Fix title underline for "Task information"
Message-ID: <aGgcxuT7YQx4YC2Q@black.fi.intel.com>
References: <20250627171715.438304-1-andrealmeid@igalia.com>
 <52c32d1b-e5c4-4f6d-82a3-cf02c0cf4681@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <52c32d1b-e5c4-4f6d-82a3-cf02c0cf4681@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 04, 2025 at 01:46:07PM -0300, André Almeida wrote:
> Raag, gently ping for reviewing this series.

Somehow this didn't land in my inbox and I have no idea why.

Raag

> Em 27/06/2025 14:17, André Almeida escreveu:
> > Fix the following warning:
> > 
> > Documentation/gpu/drm-uapi.rst:450: WARNING: Title underline too short.
> > 
> > Task information
> > --------------- [docutils]
> > 
> > Fixes: cd37124b4093 ("drm/doc: Add a section about "Task information" for the wedge API")
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Signed-off-by: André Almeida <andrealmeid@igalia.com>
> > ---
> > v2: Add Reported-by tag
> > ---
> >   Documentation/gpu/drm-uapi.rst | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> > index 263e5a97c080..10dea6a1f097 100644
> > --- a/Documentation/gpu/drm-uapi.rst
> > +++ b/Documentation/gpu/drm-uapi.rst
> > @@ -447,7 +447,7 @@ hang is usually the most critical one which can result in consequential hangs or
> >   complete wedging.
> >   Task information
> > ----------------
> > +----------------
> >   The information about which application (if any) was involved in the device
> >   wedging is useful for userspace if they want to notify the user about what
> > @@ -728,4 +728,4 @@ Stable uAPI events
> >   From ``drivers/gpu/drm/scheduler/gpu_scheduler_trace.h``
> >   .. kernel-doc::  drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> > -   :doc: uAPI trace events
> > \ No newline at end of file
> > +   :doc: uAPI trace events
> 
