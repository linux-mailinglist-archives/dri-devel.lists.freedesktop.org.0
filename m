Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5C4375231
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 12:21:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB1C6ECAF;
	Thu,  6 May 2021 10:21:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 467366ECAD;
 Thu,  6 May 2021 10:21:17 +0000 (UTC)
IronPort-SDR: ZmXkCypgnmzoVvtWKlIqBGmSyY9bKk2gBtt7MCnGF2Fq/4gOSu/qNGE7UN3UCXyVgSMoPOy+gd
 eCVAgRa3yFag==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="259715420"
X-IronPort-AV: E=Sophos;i="5.82,277,1613462400"; d="scan'208";a="259715420"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 03:21:16 -0700
IronPort-SDR: GgolOtDyPmHA/AIXB+KiwHGt5NW9QGzfa9aW81ZjEibtnyclbuj615P6XnszvPQ32QQ1hregfS
 LUCS18Prlk6Q==
X-IronPort-AV: E=Sophos;i="5.82,277,1613462400"; d="scan'208";a="430465859"
Received: from tchrzano-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.42.214])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 03:21:11 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Werner Sembach <wse@tuxedocomputers.com>, wse@tuxedocomputers.com,
 ville.syrjala@linux.intel.com, airlied@linux.ie, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Intel-gfx] [PATCH 1/3] New function to avoid duplicate code in
 upcomming commits
In-Reply-To: <20210505172401.1453178-2-wse@tuxedocomputers.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210505172401.1453178-1-wse@tuxedocomputers.com>
 <20210505172401.1453178-2-wse@tuxedocomputers.com>
Date: Thu, 06 May 2021 13:21:08 +0300
Message-ID: <87pmy4w4bv.fsf@intel.com>
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

On Wed, 05 May 2021, Werner Sembach <wse@tuxedocomputers.com> wrote:
> Subject: [PATCH 1/3] New function to avoid duplicate code in upcomming commits

Also, the subject should have a prefix, such as "drm/i915/hdmi: "
etc. depending on what you're changing. See git log on the files for
examples.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
