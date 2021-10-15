Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4DE42FC56
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 21:43:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E630B6E56A;
	Fri, 15 Oct 2021 19:43:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9994A6E56A
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 19:43:02 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 20418419-2df0-11ec-ac3c-0050568cd888;
 Fri, 15 Oct 2021 19:43:09 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 9E329194B3E;
 Fri, 15 Oct 2021 21:43:08 +0200 (CEST)
Date: Fri, 15 Oct 2021 21:42:59 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 1/6] drm/sysfs: introduce
 drm_sysfs_connector_hotplug_event
Message-ID: <YWnZw19LEvDZHe1h@ravnborg.org>
References: <20211015163336.95188-1-contact@emersion.fr>
 <20211015163336.95188-2-contact@emersion.fr>
 <YWnYYNLL+Sg6JXYL@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YWnYYNLL+Sg6JXYL@ravnborg.org>
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

On Fri, Oct 15, 2021 at 09:37:04PM +0200, Sam Ravnborg wrote:
> Hi Simon,
> 
> On Fri, Oct 15, 2021 at 04:33:41PM +0000, Simon Ser wrote:
> > This function sends a hotplug uevent with a CONNECTOR property.
> 
> A little late feedback.
> 
> 	Sam

If you keep current code then patch is:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

As current code is perfectly fine and a similar pattern is used in the
same file elsewhere.

	Sam
