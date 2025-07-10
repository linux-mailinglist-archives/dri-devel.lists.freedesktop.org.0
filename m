Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DA2B00E4D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 00:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD2110E97A;
	Thu, 10 Jul 2025 22:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kz8a95eX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50AEA10E97F
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 22:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752184805; x=1783720805;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Lc891ix4xvedwTi78TFh6r6//wDoNaZgeUBTsm8u/pI=;
 b=Kz8a95eX81F4D+FfyQyucD1QV7q1vY3tNbrjBYIrsE5CuFthqwNkCT1t
 uu1SqvA7PJh6waJSL436aavJjycNAflACQ0AP3gQWqqBSjsxbtsfIZBYa
 mAw46wh+3RLlB1N61vj0ML5Hjt04sFJ2Hga4qHvPx5czFR5mZLRPKXnaW
 x3wEhcaILtSbiXV1vwT8STm59PafB5dQnxsZTWVbnlIrYcAbFMXrLU+Bf
 hpnZOg0FRIX+sM7OzD8tca13fqoIZ0JLS+vPCjN04eJB9MavFI1wMoPoz
 4aOhun42MReNoIhzOnKWpoZUSHPW0+35rdtbQmz0FYEZQ5Z8vbLLJZSco w==;
X-CSE-ConnectionGUID: Nh7+qWz6Q9KIooKrAVy/Og==
X-CSE-MsgGUID: w8B6i2lEQICHmNtfofKDYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54633241"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="54633241"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 15:00:05 -0700
X-CSE-ConnectionGUID: 4yL8EGaLQr2gZdTTaeGi7A==
X-CSE-MsgGUID: gyvHSjQjTISkbx8Z7BDXvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="156691429"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 15:00:02 -0700
Date: Fri, 11 Jul 2025 00:59:58 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 airlied@gmail.com, simona@ffwll.ch,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
Subject: Re: [PATCH v4 1/3] drm/doc: Fix title underline for "Task information"
Message-ID: <aHA33ispT8V6GUhn@black.fi.intel.com>
References: <20250704190724.1159416-1-andrealmeid@igalia.com>
 <08de556b-e63c-420e-8ab4-c03712be9709@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <08de556b-e63c-420e-8ab4-c03712be9709@igalia.com>
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

On Thu, Jul 10, 2025 at 06:27:45PM -0300, André Almeida wrote:
> Em 04/07/2025 16:07, André Almeida escreveu:
> > Fix the following warning:
> > 
> > Documentation/gpu/drm-uapi.rst:450: WARNING: Title underline too short.
> > 
> > Task information
> > --------------- [docutils]
> > 
> 
> This series is now merged at drm-misc-next, thanks!

Shouldn't this be drm-misc-fixes?

Also, this series continues to not land in my inbox. This is why I use raw
emails in my sendmail automation.

Raag
