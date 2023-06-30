Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D682B744505
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jul 2023 01:09:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44B110E198;
	Fri, 30 Jun 2023 23:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D9C10E198
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 23:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=sQH8tccFhYX/NQeWTti+WtaVv10KvJyfQCLpKVIjTBE=; b=wd7Mqjy08sPiR4+0fwIdZ25XoR
 nZmIhg+DZ+mCOnOdGCP77YT3GSlTkAjuw27hceuVscfUKBj1Vg8bF5SU2z0o3VuQwB4OTtyjmRl6y
 9b4klXqEi3fYQiBks75szNI+m+TXMWLsxfppof15/7hnMk3iiElEZUWxLADM2K7wb5XniyM2pXmKJ
 SodL6SPun5c7XgRx1Y8lwK2FQ5BXkyJsMqtyxcitLozNkV1CFm+5LFRWE+0SHnQc7gcWAzfKs4Pyl
 NBuKXf6j3eYjbvNFV2xKkpTWv3jD59h3jqqcdg6vyaTlJmeGzWRfJVsnDlKbtUbXxvRdF4OL1cqND
 ozxePWLA==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red
 Hat Linux)) id 1qFNEh-004jg2-2c; Fri, 30 Jun 2023 23:09:07 +0000
Date: Fri, 30 Jun 2023 16:09:07 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 2/2] modules/firmware: add a new option to denote a
 firmware group to choose one.
Message-ID: <ZJ9gk1Y9l1TUbu/t@bombadil.infradead.org>
References: <20230426042906.724352-1-airlied@gmail.com>
 <20230426042906.724352-2-airlied@gmail.com>
 <dd6bd147-6d5f-ee2c-4feb-ec3376c01a87@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd6bd147-6d5f-ee2c-4feb-ec3376c01a87@infradead.org>
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
Cc: Dave Airlie <airlied@redhat.com>, linux-modules@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 22, 2023 at 02:12:32PM -0700, Randy Dunlap wrote:
> Is this going anywhere? It was posted about 2 months ago.

Last I heard Dave was still working with Lucas on this?

  Luis
