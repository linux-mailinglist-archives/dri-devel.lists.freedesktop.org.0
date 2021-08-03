Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 092B63DE608
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 07:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 789076E2C7;
	Tue,  3 Aug 2021 05:10:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537656E2C7
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 05:10:49 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 3413438d-f419-11eb-8d1a-0050568cd888;
 Tue, 03 Aug 2021 05:11:05 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 25FDA194B1F;
 Tue,  3 Aug 2021 07:11:11 +0200 (CEST)
Date: Tue, 3 Aug 2021 07:10:45 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Dea, Edmund J" <edmund.j.dea@intel.com>
Subject: Re: [PATCH 13/14] drm/kmb: Enable alpha blended second plane
Message-ID: <YQjP1e+XrYrrsggB@ravnborg.org>
References: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
 <20210728003126.1425028-13-anitha.chrisanthus@intel.com>
 <YQEHQ56Qwl0GzvKg@ravnborg.org>
 <BY5PR11MB41821BFC25FECD3D9834C7D58CEF9@BY5PR11MB4182.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BY5PR11MB41821BFC25FECD3D9834C7D58CEF9@BY5PR11MB4182.namprd11.prod.outlook.com>
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

Hi Anitha,

On Mon, Aug 02, 2021 at 08:44:26PM +0000, Chrisanthus, Anitha wrote:
> Hi Sam,
> Thanks. Where should this go, drm-misc-fixes or drm-misc-next?

Looks like a drm-misc-next candidate to me.
I may improve something for existing users, but it does not look like it
fixes an existing bug.

	Sam
