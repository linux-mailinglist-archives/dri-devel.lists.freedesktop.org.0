Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1859142FD21
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 22:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD486EDF5;
	Fri, 15 Oct 2021 20:57:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B24E26EDF5
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 20:56:59 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 7018a882-2dfa-11ec-9c3f-0050568c148b;
 Fri, 15 Oct 2021 20:56:58 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 7EEDE194B3E;
 Fri, 15 Oct 2021 22:57:05 +0200 (CEST)
Date: Fri, 15 Oct 2021 22:56:55 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Bryant Mairs <bryant@mai.rs>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: panel-orientation-quirks: Add quirk for Aya Neo 2021
Message-ID: <YWnrFx+vfIutc5wR@ravnborg.org>
References: <20211001221618.29765-1-bryant@mai.rs>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001221618.29765-1-bryant@mai.rs>
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

On Fri, Oct 01, 2021 at 03:16:18PM -0700, Bryant Mairs wrote:
> Signed-off-by: Bryant Mairs <bryant@mai.rs>

Patch looks fine, but I do not accept empty changelogs.

At a minimum describe in the changelog what device benefit from this
quirk.

	Sam
