Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EECA7436924
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 19:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C916E484;
	Thu, 21 Oct 2021 17:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F290A6E484
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 17:36:49 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 7e9221c9-3295-11ec-ac3c-0050568cd888;
 Thu, 21 Oct 2021 17:36:59 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 9AA6F194B7C;
 Thu, 21 Oct 2021 19:36:46 +0200 (CEST)
Date: Thu, 21 Oct 2021 19:36:44 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Bryant Mairs <bryant@mai.rs>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm: panel-orientation-quirks: Add quirk for Aya Neo
 2021
Message-ID: <YXGlLJfUMLMXBfr8@ravnborg.org>
References: <20211019142433.4295-1-bryant@mai.rs>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211019142433.4295-1-bryant@mai.rs>
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

Hi Bryant,

On Tue, Oct 19, 2021 at 09:24:33AM -0500, Bryant Mairs wrote:
> Fixes screen orientation for the Aya Neo 2021 handheld gaming console.
> 
> Signed-off-by: Bryant Mairs <bryant@mai.rs>

thanks for your quick response with v2.
Applied to drm-msc-fixes, and should show up in -linus in about two
weeks.
	Sam
