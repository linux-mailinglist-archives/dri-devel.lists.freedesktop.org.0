Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD2B471BA
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2019 20:52:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 635B489272;
	Sat, 15 Jun 2019 18:52:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F09389272
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2019 18:52:05 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 619AF2184B;
 Sat, 15 Jun 2019 18:52:04 +0000 (UTC)
Date: Sat, 15 Jun 2019 20:52:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Saiyam Doshi <saiyamdoshi.in@gmail.com>
Subject: Re: [PATCH v1] staging: android: fix style problem
Message-ID: <20190615185202.GA10201@kroah.com>
References: <20190615184605.GA7671@ahmlpt0706>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190615184605.GA7671@ahmlpt0706>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560624724;
 bh=ZiyxNZ22/8DOyepnR7kpKn7cjCxVk7M7EDGwbpRg+to=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fXVijOEqPXod63gWGjwgnqNzXtTCmDh+lf+l8NWvk2ei0bYrDZ6uGnF99szd9YpB8
 J/TlFi3tLXWU4uuUlCci5RsVU1yuskt+w+5tKDmybNQS6dwCNDTleQQAPXvJe2ZKu4
 lbX/BXma7LFdNtS5cS+bqJw4ASnK3PyGy5kuPmZI=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdW4gMTYsIDIwMTkgYXQgMTI6MTY6MDVBTSArMDUzMCwgU2FpeWFtIERvc2hpIHdy
b3RlOgo+IGNoZWNrcGF0Y2ggcmVwb3J0ZWQgIldBUk5JTkc6IGxpbmUgb3ZlciA4MCBjaGFyYWN0
ZXJzIi4KPiBUaGlzIHBhdGNoIGZpeGVzIGl0IGJ5IGFsaWduaW5nIGZ1bmN0aW9uIGFyZ3VtZW50
cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTYWl5YW0gRG9zaGkgPHNhaXlhbWRvc2hpLmluQGdtYWls
LmNvbT4KPiAtLS0KPiBDaGFuZ2VzIGluIHYxOgo+ICogVXBkYXRlZCBhcyBwZXIgcmV2aWV3IGNv
bW1lbnQuIE5vdyBmdW5jdGlvbiBhcmd1bWVudHMKPiAgIHVzZXMgdHdvIGxpbmVzLCBvbmUgbGVz
cyBsaW5lIHRoYW4gcHJldmlvdXMgc3VibWlzc2lvbi4KCkl0J3MgcmVhbGx5ICJ2MiIsIGJ1dCB0
aGF0J3MgZmluZSA6KQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
