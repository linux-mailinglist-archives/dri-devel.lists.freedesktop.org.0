Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6F142FC5E
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 21:43:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F20896EDD2;
	Fri, 15 Oct 2021 19:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 910006EDD2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 19:43:49 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 3768cac4-2df0-11ec-9c3f-0050568c148b;
 Fri, 15 Oct 2021 19:43:48 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 979CC194B53;
 Fri, 15 Oct 2021 21:43:55 +0200 (CEST)
Date: Fri, 15 Oct 2021 21:43:46 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 2/6] drm/probe-helper: add
 drm_kms_helper_connector_hotplug_event
Message-ID: <YWnZ8rTmWjHbto20@ravnborg.org>
References: <20211015163336.95188-1-contact@emersion.fr>
 <20211015163336.95188-3-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015163336.95188-3-contact@emersion.fr>
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

On Fri, Oct 15, 2021 at 04:33:42PM +0000, Simon Ser wrote:
> This function is the same as drm_kms_helper_hotplug_event, but takes
> a connector instead of a device.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
