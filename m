Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7412378C322
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 13:14:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B90E10E218;
	Tue, 29 Aug 2023 11:14:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B5B10E218
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 11:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693307665; x=1724843665;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Cd8jrHh4dsAa5tMUdxv4ZSmnRPQu5S7jf793etRwrCU=;
 b=S8JTnR9OwBPdbp17dCNToCwlVg56v8V7z49mOIldaFc54rSA6ndEVwUZ
 Y3KJ2Y9y/I+b3Mc4+L66D02QIEy6ilPFNZYCC2pmBCiH5piaxYSHoFkDS
 2IUs9EZzRtxPF+5TeH55bPAuzX8M+UlyshRiW1GKGISRl18YP/KR8zwuD
 QMgj8O0VAznQedraRNDHXhpBBdjdxmLxCph2/16NC9/mKX+ty5mbwgcb+
 K7GbGKP3W5ZYqBZ1EZ032ugyrZL3UYR3b9QFeCVSMENLb8UZY8lAeRQ8j
 A69SeIUBMQLVCTlfB9cQCQpfjvVr9NMsqjG2N09XANTJagKXBfokhQNl0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="379113996"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="379113996"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 04:14:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="808629373"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="808629373"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 04:14:23 -0700
Date: Tue, 29 Aug 2023 13:14:21 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH v2 8/9] accel/ivpu/37xx: White space cleanup
Message-ID: <20230829111421.GC4086697@linux.intel.com>
References: <20230828094736.4137092-1-stanislaw.gruszka@linux.intel.com>
 <20230828094736.4137092-9-stanislaw.gruszka@linux.intel.com>
 <4eaa8bb4-f8ae-ec2e-7dc3-d74035135007@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4eaa8bb4-f8ae-ec2e-7dc3-d74035135007@quicinc.com>
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
Cc: Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 28, 2023 at 02:55:48PM -0600, Jeffrey Hugo wrote:
> On 8/28/2023 3:47 AM, Stanislaw Gruszka wrote:
> > No functional change, adjust code formatting after previous changes.
> 
> This feels incomplete.  You are doing an adjustment, but to what, and why?
> 
> Maybe -
> 
> No functional change, adjust code formatting so that defines line up nicely
> to improve code readability.

Ok, looks better, thanks :-)

Regards
Stanislaw

