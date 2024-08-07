Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC27794A853
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 15:08:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 812C910E511;
	Wed,  7 Aug 2024 13:08:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XB7fJMhX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B1310E510;
 Wed,  7 Aug 2024 13:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723036121; x=1754572121;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=9nV14Ud6xG83DB3ZS1ek+O+jkCnaVQ7aShsL9WnCXqk=;
 b=XB7fJMhXw8Luk9zOHq7P4CWm0XS0AMuGTBhpj2jQN4klWlMDtB75sIYH
 1xbbjgBpgnG+B3I+2MphXrsJJFUqe+tEQ7cR/1IRbWIE3zYA2lEB3+kK6
 rB+KM6JbqN2Ggije/4TmOeMR25HeSWaGGxcYNOPvDEYNTNf2wmMIGi09V
 49OXR43vgGjLSmdyYgNE/9H/842odI/SzhZjlsPE68/j/hpcZOYTc0oxY
 8PpV5HH2i6mXnFsULrh94JE/QIvlDmjg9KfoY+1LHh48SWGVtXqRJ7Hf/
 6UxuwWM30xnKYwOX5swEOv/Y03nv6TMBONZequMrKVfzYjXzu4+JqcY1t A==;
X-CSE-ConnectionGUID: 9yiqYB7hQeKIEZYw1QASzA==
X-CSE-MsgGUID: qbS3TB2JQ0WE/GhkUKVZaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="20768130"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="20768130"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 06:08:41 -0700
X-CSE-ConnectionGUID: mlvhVnkuTMix+CF14Bc45A==
X-CSE-MsgGUID: IPCv4Qp1SMKceb1lgusxpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="87512963"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.85])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 06:08:31 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH 0/2] Trivial double space style fix
In-Reply-To: <20240807130516.491053-1-andi.shyti@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240807130516.491053-1-andi.shyti@linux.intel.com>
Date: Wed, 07 Aug 2024 16:08:27 +0300
Message-ID: <87frrg4h10.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 07 Aug 2024, Andi Shyti <andi.shyti@linux.intel.com> wrote:
> Hi,
>
> I was bothered a few times to see the double space in the
> parameters list so that I decided to replace once and for all all
> the double spaces that are not added on purpose to maintain some
> visual alignment in the code.
>
> Checkpatch doesn't have any rules for that because, indeed, this
> is used also to put in columns parameters in repetitive function
> calls or declarations. Nevertheless, it doesn't mean it's
> stylistically correct.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> Thanks,
> Andi
>
> Andi Shyti (2):
>   drm/i915: Replace double blank with single blank after comma in gem/ and gt/
>   drm/i915: Replace double blank with single blank after comma
>
>  drivers/gpu/drm/i915/display/i9xx_wm.c               | 2 +-
>  drivers/gpu/drm/i915/display/intel_ddi.c             | 2 +-
>  drivers/gpu/drm/i915/display/intel_display.c         | 2 +-
>  drivers/gpu/drm/i915/display/intel_display_debugfs.c | 2 +-
>  drivers/gpu/drm/i915/display/intel_dp_hdcp.c         | 2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_object_types.h     | 2 +-
>  drivers/gpu/drm/i915/gt/selftest_migrate.c           | 2 +-
>  drivers/gpu/drm/i915/gt/uc/intel_uc.c                | 2 +-
>  drivers/gpu/drm/i915/gvt/trace.h                     | 2 +-
>  drivers/gpu/drm/i915/i915_driver.c                   | 6 +++---
>  drivers/gpu/drm/i915/i915_sysfs.c                    | 4 ++--
>  drivers/gpu/drm/i915/selftests/intel_memory_region.c | 2 +-
>  12 files changed, 15 insertions(+), 15 deletions(-)

-- 
Jani Nikula, Intel
