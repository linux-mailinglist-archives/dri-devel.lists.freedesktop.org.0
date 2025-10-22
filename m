Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E24BFF975
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 09:29:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5A2710E894;
	Thu, 23 Oct 2025 07:29:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.b="q0WjQ/uD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-244102.protonmail.ch (mail-244102.protonmail.ch
 [109.224.244.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9FC610E14F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 16:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1761152075; x=1761411275;
 bh=aLLP+4O1TuEFGP3Nd3w2xHUT+zEmiMbGCzDWVfJDgCk=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=q0WjQ/uDDXiNOzjAH1dZtDD4hCw9qhoBRKSeEoTf38LfbEbVVPVSzmom22HddmW46
 hVKja+x0i3y9aj8iJsTK3qXGIpHchwmcxfEycNKXC2pcP/Sr1cRYdt7URvXJBC3w5S
 HjRWlsSNd+AHByrb2Ki0UnygwIiln5+Gbsx7340DetNE3RNE+c8MmJc+q9Gjvr3e65
 Sexosghz/Eq7BYILOjXkD/MCEpOQaX1i9viPBm1aGQowxwYO13CVXooJI7jbpsrjD8
 SJKsbCJw4o1ouuK14C80YvkN4woClVabEzz2Ur+FS8MUnQxgNzc3IKVnWBqQKxGLub
 OKS4FnqOA8Qyw==
Date: Wed, 22 Oct 2025 16:54:31 +0000
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
From: CS Sushi Man <cssushiman@protonmail.com>
Subject: Question about DRM Framebuffer
Message-ID: <kJDCwu-BdCjeuVfBNgBp-i7YwQX7dzJZZfNcDbjC9gYpxsaq_IxQQHkPHEBQ2YteD6V_HWYGm2cayZYBkljjvQv4AT1bkMw1xupREPZxf6o=@protonmail.com>
Feedback-ID: 93478688:user:proton
X-Pm-Message-ID: 7bd7966f9f219b8ebca9c5d20aadcb172ba02b43
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1=_DG8g80NzNAx4S8aE6CNqx4XL1prvroaV9i67pDy10"
X-Mailman-Approved-At: Thu, 23 Oct 2025 07:29:39 +0000
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

--b1=_DG8g80NzNAx4S8aE6CNqx4XL1prvroaV9i67pDy10
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SW4gdGhlIGNhc2UgdGhhdCBJIHN0YXJ0IHVwIGFuIGFwcGxpY2F0aW9uIGZyb20gdGhlIExpbnV4
IHRlcm1pbmFsLCBjb3VsZCB5b3UgZGV0YWlsIHRoZSBwcm9jZXNzIG9mIGV4cG9zaW5nIGEgZnJh
bWUgYnVmZmVyIGRldmljZS9tZW1vcnkgc3BhY2UsIHRoYXQgaXMgZXF1aXZhbGVudCB0byBmYmRl
dj8gQW5kIGlmIHBvc3NpYmxlLCBjb3VsZCB5b3UgYWxzbyBwYXNzIG1lIGEgbGluayB0byBhbiBl
eGFtcGxlPwoKSSBkbyBrbm93IHRoYXQgYSBkZXZpY2Ugd291bGQgaGF2ZSB0byBiZSBmb3VuZCBh
bmQgbW9kZXNldCBmaXJzdCwgd2l0aCBhIGdpdmVuIENSVEMsIGFuZCBtYXliZSBhbiBlbmNvZGVy
IGFzIHdlbGwuCgpTZW50IHdpdGggW1Byb3RvbiBNYWlsXShodHRwczovL3Byb3Rvbi5tZS9tYWls
L2hvbWUpIHNlY3VyZSBlbWFpbC4=

--b1=_DG8g80NzNAx4S8aE6CNqx4XL1prvroaV9i67pDy10
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDE0
cHg7Ij5JbiB0aGUgY2FzZSB0aGF0IEkgc3RhcnQgdXAgYW4gYXBwbGljYXRpb24gZnJvbSB0aGUg
TGludXggdGVybWluYWwsIGNvdWxkIHlvdSBkZXRhaWwgdGhlIHByb2Nlc3Mgb2YgZXhwb3Npbmcg
YSBmcmFtZSBidWZmZXIgZGV2aWNlL21lbW9yeSBzcGFjZSwgdGhhdCBpcyBlcXVpdmFsZW50IHRv
IGZiZGV2PyBBbmQgaWYgcG9zc2libGUsIGNvdWxkIHlvdSBhbHNvIHBhc3MgbWUgYSBsaW5rIHRv
IGFuIGV4YW1wbGU/PGJyPjxicj5JIGRvIGtub3cgdGhhdCBhIGRldmljZSB3b3VsZCBoYXZlIHRv
IGJlIGZvdW5kIGFuZCBtb2Rlc2V0IGZpcnN0LCB3aXRoIGEgZ2l2ZW4gQ1JUQywgYW5kIG1heWJl
IGFuIGVuY29kZXIgYXMgd2VsbC48L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWws
IHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTRweDsiPjxicj48L2Rpdj4NCjxkaXYgc3R5bGU9ImZv
bnQtZmFtaWx5OiBBcmlhbCwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxNHB4OyIgY2xhc3M9InBy
b3Rvbm1haWxfc2lnbmF0dXJlX2Jsb2NrIj4NCiAgICA8ZGl2IGNsYXNzPSJwcm90b25tYWlsX3Np
Z25hdHVyZV9ibG9jay11c2VyIHByb3Rvbm1haWxfc2lnbmF0dXJlX2Jsb2NrLWVtcHR5Ij4NCiAg
ICAgICAgDQogICAgICAgICAgICA8L2Rpdj4NCiAgICANCiAgICAgICAgICAgIDxkaXYgY2xhc3M9
InByb3Rvbm1haWxfc2lnbmF0dXJlX2Jsb2NrLXByb3RvbiI+DQogICAgICAgIFNlbnQgd2l0aCA8
YSBocmVmPSJodHRwczovL3Byb3Rvbi5tZS9tYWlsL2hvbWUiIHRhcmdldD0iX2JsYW5rIj5Qcm90
b24gTWFpbDwvYT4gc2VjdXJlIGVtYWlsLg0KICAgIDwvZGl2Pg0KPC9kaXY+DQo=


--b1=_DG8g80NzNAx4S8aE6CNqx4XL1prvroaV9i67pDy10--

