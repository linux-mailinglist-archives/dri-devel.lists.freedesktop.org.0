Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B589619847A
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 21:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF846E20E;
	Mon, 30 Mar 2020 19:30:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4426E20E
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 19:30:32 +0000 (UTC)
Date: Mon, 30 Mar 2020 19:30:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1585596629;
 bh=4iV9oi4I1D7Q9ndBDDDb9h3S04vmMJxL6gYks6NCyxI=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=VAw0LnMy5RGuM1+pN+q3kmk+PXAyWXECoWTHSukek9X+mO9x0lYcZf0oSCqtSHF6f
 5wd+h+xQ5Xy1PEScGa5yVknVP4rwNMqGVeBQChsLEjO5sfLW0Uz8cDBBg3D6MBUuma
 WuCcmdYJHkbiEHutgDhmVfpbtNfjANz/zqWLM2uY=
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3 0/5] Introduce drm scaling filter property
Message-ID: <E3R30o5qjRxRLwfN8lAXK7vOlsZquoDyWBCyOM-vMFydzPZRwt7eooF86fBNKECvvLAzSsFWC-jWfu5RXyxIIAAwJmcGS3HULQvvYO8m0X4=@emersion.fr>
In-Reply-To: <20200330183857.13270-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200330183857.13270-1-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: "daniels@collabora.com" <daniels@collabora.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Monday, March 30, 2020 8:38 PM, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com> wrote:

> Userspace patch series link: https://github.com/lrusak/xbmc/pull/24

This pull request is against a fork, not the official Kodi repository.
Are there any plans to upstream the change so that users can benefit
from it? Is there a reason why this pull request hasn't been opened
against the official repo?

Thanks,

Simon


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
