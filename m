Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADB31EE922
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 19:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B89C6E51D;
	Thu,  4 Jun 2020 17:08:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B1B89E01
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jun 2020 17:08:23 +0000 (UTC)
Date: Thu, 04 Jun 2020 17:08:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1591290501;
 bh=fcdR2PwZpgv4VLFNovsJiyebMA0gyH1vjRnFs8jImZU=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=N7E9JeNm2O80+1P1voKI1b4SrQQITt0vQy2SffhejFtFKgZzj5Y3ZdTsns8EpiKx+
 JfKiGqscVUmtOYWeaJOlnQrDfWSsHaSq7wJvz0/WAFpKUu2rkNxU9MK9Jz9z9A9ox9
 v/oy0j/nk5Lypvlmbx6hHhX5FONZIDj2/hwQXJmA=
To: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] Fix reserve start and end for lmem of remote tiles
Message-ID: <Ja3oVwr9jRGXHm4ZKQKpiiPht6IuWj-TOtou-yZVF72Z55eH9hHkOqA3sdPw5L7Kb_x6RPXQ7CLUjBAnOBYGZI36yLLgUjHEHTpTX5aZMdo=@emersion.fr>
In-Reply-To: <20200604165551.876191-1-ayaz.siddiqui@intel.com>
References: <20200604165551.876191-1-ayaz.siddiqui@intel.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch is i915-specific. It should be sent to
intel-gfx@lists.freedesktop.org instead of dri-devel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
