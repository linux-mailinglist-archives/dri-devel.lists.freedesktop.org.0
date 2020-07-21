Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6092229185
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 09:03:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A98EC6E42B;
	Wed, 22 Jul 2020 07:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5976E423
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 15:57:41 +0000 (UTC)
IronPort-SDR: yTP5o3TSjEmxl9JfZkXo3XvI3HY8owj/OxxzpGqFiuRljPJj+p1AO8Yr5ApFuWxs0dIMutO9ou
 Y5yg5KAV+iTQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="130238037"
X-IronPort-AV: E=Sophos;i="5.75,379,1589266800"; d="scan'208";a="130238037"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2020 08:57:40 -0700
IronPort-SDR: rzMEvRpzgHu589bLRhLKCj5E5AoYkqQoC/8PtrzuhL0ldKTEfbp99N7KuhMiGDmNSzBTlZbo3n
 oZGGVknll7ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,379,1589266800"; d="scan'208";a="270474782"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga007.fm.intel.com with ESMTP; 21 Jul 2020 08:57:39 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jxueB-0035xa-SV; Tue, 21 Jul 2020 18:57:39 +0300
Date: Tue, 21 Jul 2020 18:57:39 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: Re: io-mapping: Indicate mapping failure
Message-ID: <20200721155739.GN3703480@smile.fi.intel.com>
References: <20200721153426.81239-1-michael.j.ruhl@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721153426.81239-1-michael.j.ruhl@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Wed, 22 Jul 2020 07:02:50 +0000
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
Cc: dri-devel@lists.freedesktop.org, Mike Rapoport <rppt@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 21, 2020 at 11:34:25AM -0400, Michael J. Ruhl wrote:
> I found this when my system crashed long after the mapping failure.
> The expected behavior should have been driver exit.
> 
> Since this is almost exclusively used for drm, I am posting to
> the dri mailing list.  Should this go to another list as well?

Just drop this cover letter. For single patch is not needed. Use place
immediately after cutter '---' line for comments like above.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
