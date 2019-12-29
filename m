Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D613E12C361
	for <lists+dri-devel@lfdr.de>; Sun, 29 Dec 2019 17:22:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 654F689801;
	Sun, 29 Dec 2019 16:22:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE8989801
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Dec 2019 16:22:30 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Dec 2019 08:22:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,372,1571727600"; d="scan'208";a="368420855"
Received: from cmacnama-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.251.86.27])
 by orsmga004.jf.intel.com with ESMTP; 29 Dec 2019 08:22:28 -0800
Date: Sun, 29 Dec 2019 16:22:28 +0000
From: Eric Engestrom <eric.engestrom@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Subject: Re: Requesting commit access to libdrm
Message-ID: <20191229162212.2mfnarunvgxahydt@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. 1134945 - Pipers Way,
 Swindon SN3 1RJ
References: <3f7684b82dab9f5294dce76ad0a997e368759d2d.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3f7684b82dab9f5294dce76ad0a997e368759d2d.camel@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, 2019-12-16 16:51:28 +0000, Souza, Jose wrote:
> Hello
> 
> I have being contributing to i915 for the past 2 years and part of my
> work is update the PCI ids of Intel devices in libdrm.
> Being able to push my reviewed patches would be really helpful, please
> consider this request.

This is somewhat orthogonal to your access request, but libdrm now uses
Merge Requests (https://gitlab.freedesktop.org/mesa/drm/merge_requests),
which means if you post a change and it's been reviewed, any one of the
100+ members can click the "merge" button for you, so not having access
yourself shouldn't be an issue, especially with the number of Intel devs
who do have access.

(It also means changes are tested (although mostly build-tested for now)
before they are merged, which reduces the frequency of breakages,
especially subtle ones.)

You can still request access if you want by opening an issue
(https://gitlab.freedesktop.org/mesa/drm/issues/new), but since you have
very few commits you'll need approval from another member; I suggest you
cc Lucas (@demarchi) & Rodrigo (@vivijim) by tagging them in your issue.

Hope this helps :)

Cheers,
  Eric
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
