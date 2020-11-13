Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 959D92B1375
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 01:47:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936C76E284;
	Fri, 13 Nov 2020 00:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CCBD6E284;
 Fri, 13 Nov 2020 00:47:21 +0000 (UTC)
IronPort-SDR: nKbWImffx14UCZEsZMDaZS1HqzXhHcKrXLkML2lx3UuOYL87Drx2ldyUCVWS70jIqtuDNRo5sF
 9lhrsQOPC8KQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="170575188"
X-IronPort-AV: E=Sophos;i="5.77,473,1596524400"; d="scan'208";a="170575188"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 16:47:20 -0800
IronPort-SDR: kX2LEku8J9jEs/UQob+SMs5I56aQTLBpHtbQO6u7n4XI/ywqfJQl+wSx648VGFH2ia4/tEJtXp
 FLOasoDnU/gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,473,1596524400"; d="scan'208";a="355385711"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga008.jf.intel.com with ESMTP; 12 Nov 2020 16:47:20 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 12 Nov 2020 16:47:19 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 12 Nov 2020 16:47:19 -0800
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.1713.004;
 Thu, 12 Nov 2020 16:47:18 -0800
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PULL] drm-intel-fixes
Thread-Topic: [PULL] drm-intel-fixes
Thread-Index: AQHWuUix0fAXKxh7cESlsTPr58ws0KnFvIwAgAAEDoA=
Date: Fri, 13 Nov 2020 00:47:18 +0000
Message-ID: <EE02662F-2EFA-43FD-B829-BCD95DA1588D@intel.com>
References: <20201112230924.GA1283868@intel.com>
 <CAPM=9twOzjdgcQxXR3K6f_aYcasnB-DyQ=3qZey=v3VeqGjjsg@mail.gmail.com>
In-Reply-To: <CAPM=9twOzjdgcQxXR3K6f_aYcasnB-DyQ=3qZey=v3VeqGjjsg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.4)
x-originating-ip: [10.22.254.132]
Content-ID: <F47CF53A48BA344095C1486074668350@intel.com>
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
Cc: "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> On Nov 12, 2020, at 4:32 PM, Dave Airlie <airlied@gmail.com> wrote:
> 
> On Fri, 13 Nov 2020 at 09:08, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>> 
>> Hi Dave and Daniel,
>> 
>> This is the same set as last week + couple new fixes targeting stable.
>> 
> 
> But I merged last weeks set and it's in rc3, maybe you can generate
> the pull request relative to origin/master or drm/drm-fixes because
> I'm not sure which bits to edit out here.

oh, of course... bad rebase on my part. Sorry...
Please ignore this one. I'm going to generate another one soon.

> 
> Dave.
> 
>> Thanks,
>> Rodrigo.
>> 
>> drm-intel-fixes-2020-11-12-1:
>> - GVT fixes including vGPU suspend/resume fixes and workaround for APL guest GPU hang.
>> - Fix set domain's cache coherency (Chris)
>> - Fixes around breadcrumbs (Chris)
>> - Fix encoder lookup during PSR atomic (Imre)
>> - Hold onto an explicit ref to i915_vma_work.pinned (Chris)
>> - Pull phys pread/pwrite implementations to the backend (Chris)
>> - Correctly set SFC capability for video engines
>> The following changes since commit 3cea11cd5e3b00d91caf0b4730194039b45c5891:
>> 
>>  Linux 5.10-rc2 (2020-11-01 14:43:51 -0800)
>> 
>> are available in the Git repository at:
>> 
>>  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2020-11-12-1
>> 
>> for you to fetch changes up to a4264790f4c2f0062d27d8173344c914bc7884e0:
>> 
>>  drm/i915: Correctly set SFC capability for video engines (2020-11-12 16:41:54 -0500)
>> 
>> ----------------------------------------------------------------
>> - GVT fixes including vGPU suspend/resume fixes and workaround for APL guest GPU hang.
>> - Fix set domain's cache coherency (Chris)
>> - Fixes around breadcrumbs (Chris)
>> - Fix encoder lookup during PSR atomic (Imre)
>> - Hold onto an explicit ref to i915_vma_work.pinned (Chris)
>> - Pull phys pread/pwrite implementations to the backend (Chris)
>> - Correctly set SFC capability for video engines
>> 
>> ----------------------------------------------------------------
>> Chris Wilson (6):
>>      drm/i915/gem: Flush coherency domains on first set-domain-ioctl
>>      drm/i915/gt: Use the local HWSP offset during submission
>>      drm/i915/gt: Expose more parameters for emitting writes into the ring
>>      drm/i915/gt: Flush xcs before tgl breadcrumbs
>>      drm/i915: Hold onto an explicit ref to i915_vma_work.pinned
>>      drm/i915/gem: Pull phys pread/pwrite implementations to the backend
>> 
>> Colin Xu (4):
>>      drm/i915/gvt: Allow zero out HWSP addr on hws_pga_write
>>      drm/i915/gvt: Set SNOOP for PAT3 on BXT/APL to workaround GPU BB hang
>>      drm/i915/gvt: Only pin/unpin intel_context along with workload
>>      drm/i915/gvt: Fix mmio handler break on BXT/APL.
>> 
>> Imre Deak (1):
>>      drm/i915: Fix encoder lookup during PSR atomic check
>> 
>> Matthew Auld (1):
>>      drm/i915/gem: Allow backends to override pread implementation
>> 
>> Venkata Sandeep Dhanalakota (1):
>>      drm/i915: Correctly set SFC capability for video engines
>> 
>> drivers/gpu/drm/i915/display/intel_psr.c         |  2 +-
>> drivers/gpu/drm/i915/gem/i915_gem_domain.c       | 28 ++++++------
>> drivers/gpu/drm/i915/gem/i915_gem_object_types.h |  2 +
>> drivers/gpu/drm/i915/gem/i915_gem_phys.c         | 55 ++++++++++++++++++++++++
>> drivers/gpu/drm/i915/gt/intel_engine.h           | 55 +++++++++++++++---------
>> drivers/gpu/drm/i915/gt/intel_engine_cs.c        |  3 +-
>> drivers/gpu/drm/i915/gt/intel_lrc.c              | 31 +++++++++----
>> drivers/gpu/drm/i915/gt/intel_timeline.c         | 18 ++++----
>> drivers/gpu/drm/i915/gt/intel_timeline_types.h   |  2 +
>> drivers/gpu/drm/i915/gvt/handlers.c              | 47 ++++++++++++++++++--
>> drivers/gpu/drm/i915/gvt/scheduler.c             | 15 ++++---
>> drivers/gpu/drm/i915/i915_gem.c                  | 32 +++-----------
>> drivers/gpu/drm/i915/i915_vma.c                  |  6 ++-
>> 13 files changed, 204 insertions(+), 92 deletions(-)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
