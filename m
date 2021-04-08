Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DAE358168
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 13:13:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2623E6EA91;
	Thu,  8 Apr 2021 11:13:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995416EA8D;
 Thu,  8 Apr 2021 11:13:32 +0000 (UTC)
IronPort-SDR: 6xB9HUDBXfguMJNNxfGIMpgw11H6upQ7DezcUTsY8ktum5vzn57LCpY2KtBHpf3XTreaVg3sHk
 AzOQ/OJv4SZg==
X-IronPort-AV: E=McAfee;i="6000,8403,9947"; a="172992372"
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; d="scan'208";a="172992372"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2021 04:13:30 -0700
IronPort-SDR: rq/99qS2pfwPDMCaPwdJEHFtHYYnS91hgLbRVWbwNSweFDQjMFFUFROPCrucjMhpF76UYug0GS
 fUffqDJmstNg==
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; d="scan'208";a="422193610"
Received: from akervine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.34.131])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2021 04:13:27 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH v2 00/20] drm: Use new DRM printk funcs (like
 drm_dbg_*()) in DP helpers
In-Reply-To: <YG7fz5UmK/SaoY/U@phenom.ffwll.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210326203807.105754-1-lyude@redhat.com>
 <87blaym8by.fsf@intel.com> <YG7fz5UmK/SaoY/U@phenom.ffwll.local>
Date: Thu, 08 Apr 2021 14:13:24 +0300
Message-ID: <87zgy9hvvv.fsf@intel.com>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 08 Apr 2021, Daniel Vetter <daniel@ffwll.ch> wrote:
> I think Dave caught up on pulls to drm-next, so after a backmerge of that
> to drm-misc-next I think should be all fine to apply directly, no need for
> topic branch.

Yup. We've done the backmerges to drm-intel-next and drm-intel-gt-next,
and are all in sync, it's only the drm-next -> drm-misc-next backmerge
that's still needed.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
