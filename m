Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A06A5C8D38
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 17:46:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A81146E215;
	Wed,  2 Oct 2019 15:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD956E215
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 15:46:52 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id E1C4A491;
 Wed,  2 Oct 2019 15:46:51 +0000 (UTC)
Date: Wed, 2 Oct 2019 09:46:50 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Mat King <mathewk@google.com>
Subject: Re: New sysfs interface for privacy screens
Message-ID: <20191002094650.3fc06a85@lwn.net>
In-Reply-To: <CAL_quvRknSSVvXN3q_Se0hrziw2oTNS3ENNoeHYhvciCRq9Yww@mail.gmail.com>
References: <CAL_quvRknSSVvXN3q_Se0hrziw2oTNS3ENNoeHYhvciCRq9Yww@mail.gmail.com>
Organization: LWN.net
MIME-Version: 1.0
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, rafael@kernel.org,
 gregkh@linuxfoundation.org, Ross Zwisler <zwisler@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jingoo Han <jingoohan1@gmail.com>, Rajat Jain <rajatja@google.com>,
 Lee Jones <lee.jones@linaro.org>, Alexander Schremmer <alex@alexanderweb.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxIE9jdCAyMDE5IDEwOjA5OjQ2IC0wNjAwCk1hdCBLaW5nIDxtYXRoZXdrQGdvb2ds
ZS5jb20+IHdyb3RlOgoKPiBJIGhhdmUgYmVlbiBsb29raW5nIGludG8gYWRkaW5nIExpbnV4IHN1
cHBvcnQgZm9yIGVsZWN0cm9uaWMgcHJpdmFjeQo+IHNjcmVlbnMgd2hpY2ggaXMgYSBmZWF0dXJl
IG9uIHNvbWUgbmV3IGxhcHRvcHMgd2hpY2ggaXMgYnVpbHQgaW50byB0aGUKPiBkaXNwbGF5IGFu
ZCBhbGxvd3MgdXNlcnMgdG8gdHVybiBpdCBvbiBpbnN0ZWFkIG9mIG5lZWRpbmcgdG8gdXNlIGEK
PiBwaHlzaWNhbCBwcml2YWN5IGZpbHRlci4gSW4gZGlzY3Vzc2lvbnMgd2l0aCBteSBjb2xsZWFn
dWVzIHRoZSBpZGVhIG9mCj4gdXNpbmcgZWl0aGVyIC9zeXMvY2xhc3MvYmFja2xpZ2h0IG9yIC9z
eXMvY2xhc3MvbGVkcyBidXQgdGhpcyBuZXcKPiBmZWF0dXJlIGRvZXMgbm90IHNlZW0gdG8gcXVp
dGUgZml0IGludG8gZWl0aGVyIG9mIHRob3NlIGNsYXNzZXMuCgpGV0lXLCBpdCBzZWVtcyB0aGF0
IHlvdSdyZSBub3QgYWxvbmUgaW4gdGhpczsgNS40IGdvdCBzb21lIHN1cHBvcnQgZm9yCnN1Y2gg
c2NyZWVucyBpZiBJIHVuZGVyc3RhbmQgdGhpbmdzIGNvcnJlY3RseToKCiAgaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2Nv
bW1pdC8/aWQ9MTEwZWExZDgzM2FkCgpqb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
