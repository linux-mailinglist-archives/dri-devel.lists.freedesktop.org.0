Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A8386C8F2
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 13:15:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 687FA10E192;
	Thu, 29 Feb 2024 12:15:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ki+GRa/O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE9510E192;
 Thu, 29 Feb 2024 12:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709208930; x=1740744930;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:cc:from:to:subject:message-id:date;
 bh=7JW5a96LhXrKrTtbr+0l/ZJtLu422Uf2mF5PXmTYswI=;
 b=ki+GRa/OnZj+Wpg0Msx0tpHRiPm7cOAX4OuEf05XCI3AB6bsQ/mI+hjQ
 iLtT/pN+p14qZKikrurqrKwlS8r6W9eycf2WSEDbyKMmNC7m2ZvuBEqes
 cgXXMMfFGByBShHWXaT7hzCWTlCKY1C8Mlt+5gGqfyaCwZdAmSjc3mtmP
 G6VMTcV5PzG0ns7sYoptRDIJlcIPtXdUK5kex8zO11C959NjjbY+uRhNw
 vqRNq0tpoFlsHVbj0sCN+tGtdLlWNdynw9jNOeYyRoMlWnh3Cfs4dBRlZ
 EkeaKoXRFF9tAOIlJDpS0OHo04yrtOhICH0itSZMo4X8DntLRzzCCeDHU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3552421"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3552421"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 04:15:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="38649580"
Received: from unknown (HELO localhost) ([10.245.244.80])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 04:15:27 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240228142240.2539358-1-tvrtko.ursulin@linux.intel.com>
References: <20240228142240.2539358-1-tvrtko.ursulin@linux.intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, Jani Nikula <jani.nikula@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Update email address for Tvrtko Ursulin
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <170920892379.4178.17894356700899757288@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Thu, 29 Feb 2024 14:15:23 +0200
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

Quoting Tvrtko Ursulin (2024-02-28 16:22:40)
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>=20
> I will lose access to my @.*intel.com e-mail addresses soon so let me
> adjust the maintainers entry and update the mailmap too.
>=20
> While at it consolidate a few other of my old emails to point to the
> main one.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Acked-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>

Regards, Joonas
