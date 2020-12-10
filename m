Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D672D5605
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 10:03:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E6B06EA47;
	Thu, 10 Dec 2020 09:03:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1DD6EA2F;
 Thu, 10 Dec 2020 09:03:53 +0000 (UTC)
IronPort-SDR: dUdb2ubIIA4HfhurXR1SrK8Pu74AVhsPB2b/GUJtqEJfRn33cqg1rtrBSfU7ASnJ1bIE7ffJvz
 6OoclCjENUTw==
X-IronPort-AV: E=McAfee;i="6000,8403,9830"; a="235816546"
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; d="scan'208";a="235816546"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 01:03:52 -0800
IronPort-SDR: sKBmhPXor5VBChELwDnmhnBI4BpGCr4GPGsjmr82dRxVjk03bslrp8o5EIzhxfyY4uaRyHsR/Q
 9GlLgQOMoX8Q==
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; d="scan'208";a="364539850"
Received: from yechielg-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.81.29])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 01:03:40 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie, daniel@ffwll.ch
Subject: Re: [PATCH v2 09/20] drm/i915: Remove references to struct
 drm_device.pdev
In-Reply-To: <7c9b3127-0e79-fd22-0bba-b3e8430d876a@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201201103542.2182-1-tzimmermann@suse.de>
 <20201201103542.2182-10-tzimmermann@suse.de>
 <7c9b3127-0e79-fd22-0bba-b3e8430d876a@suse.de>
Date: Thu, 10 Dec 2020 11:03:35 +0200
Message-ID: <875z5a9gns.fsf@intel.com>
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
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 amd-gfx@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 spice-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 08 Dec 2020, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> ping for a review of the i915 patches

What did you have in mind regarding merging the series? Should we just
pick the patches up?

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
