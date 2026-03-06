Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJpEHBK+qmlXWQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 12:44:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7A721FD16
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 12:44:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 801A710ED05;
	Fri,  6 Mar 2026 11:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lXjGRn5Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD4010ED07;
 Fri,  6 Mar 2026 11:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772797455; x=1804333455;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=20PS3c+U1YMZpbeRKjNjK2/ifTZT6pCSQmUPOxZEiNI=;
 b=lXjGRn5Z+bspGTrWIRxPpnxFTRno6+DOjVoEaGxCysk/jFrsmZSo4ip0
 IXPfD9zyTriKhXPtYLm+J7tRP6FV//U4ULISJ2NN5KxLL1W1aPkw18X1O
 rA0+SNKLuyvOJFOAHcIhjTJlNd7Vv7GxoM5SK9fUSrCGCv9dhSmPDMPvP
 Vii9Gi9W+USlEfM7mOhcgWf5Jw06xQuR3PxJYs+r1/fsYMHK2KYmr1SOP
 yl1Xp+B5w+JyrbxMRKWKjlta5uNmcpoLh0NMT3u7hLaJSOTMcr5AGlEdV
 aVL2DhKyMVp7sui5bR1RQEdom/YWeH2z4JLFLrO7kzkC/Bp9I+/VkPqMt Q==;
X-CSE-ConnectionGUID: qGaHDXBfT9GGWQjRv6MjaA==
X-CSE-MsgGUID: Ui3nwudFR1eiR8Biw5ZkiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73094690"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="73094690"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 03:44:14 -0800
X-CSE-ConnectionGUID: ntlJDwFBSEKSvGUaNJu8xg==
X-CSE-MsgGUID: Y0bMxfCPSD2B8mcKI6ILog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="218222701"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.236])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 03:44:13 -0800
Date: Fri, 6 Mar 2026 12:44:09 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Konstantin Khorenko <khorenko@virtuozzo.com>
Cc: John Harrison <John.C.Harrison@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/guc: fix corrupted copyright symbols in
 selftest files
Message-ID: <aaq-CSoBJl4xxNBp@ashyti-mobl2.lan>
References: <20260209112709.2551603-1-khorenko@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260209112709.2551603-1-khorenko@virtuozzo.com>
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
X-Rspamd-Queue-Id: 3B7A721FD16
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[andi.shyti@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Action: no action

Hi Konstantin,

On Mon, Feb 09, 2026 at 12:27:09PM +0100, Konstantin Khorenko wrote:
> Replace broken UTF-8 sequences (Unicode replacement characters) with
> proper "©" text in copyright headers.
> 
> Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>

merged to drm-intel-gt-next.

Thanks,
Andi
