Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83906E0024
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 10:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5617B6E49D;
	Tue, 22 Oct 2019 08:58:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD6A6E49D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 08:58:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: shadeslayer) with ESMTPSA id 3D28A28C230
From: Rohan Garg <rohan.garg@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4] drm/ioctl: Add a ioctl to label GEM objects
Date: Tue, 22 Oct 2019 10:58:41 +0200
Message-ID: <2975162.debWhmaBkT@saphira>
In-Reply-To: <CAPj87rOMMdi0zUdjEKeiUsLpfQkTPf3adEfw13ur6UQtNdNUxQ@mail.gmail.com>
References: <20191011143009.17503-1-rohan.garg@collabora.com>
 <CAPj87rOMMdi0zUdjEKeiUsLpfQkTPf3adEfw13ur6UQtNdNUxQ@mail.gmail.com>
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
Cc: kernel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGV5Ck9uIHZpZXJuZXMsIDExIGRlIG9jdHVicmUgZGUgMjAxOSAxOTowOTo1MiAoQ0VTVCkgRGFu
aWVsIFN0b25lIHdyb3RlOgo+IEhpIFJvaGFuLAo+IAo+IE9uIEZyaSwgMTEgT2N0IDIwMTkgYXQg
MTU6MzAsIFJvaGFuIEdhcmcgPHJvaGFuLmdhcmdAY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4gPiBE
Uk1fSU9DVExfRFVNQl9TRVRfTEFCRUwgbGV0cyB5b3UgbGFiZWwgR0VNIG9iamVjdHMsIG1ha2lu
ZyBpdAo+ID4gZWFzaWVyIHRvIGRlYnVnIGlzc3VlcyBpbiB1c2Vyc3BhY2UgYXBwbGljYXRpb25z
Lgo+IAo+IEknbSBub3Qgc3VyZSBpZiB0aGlzIHdhcyBwb2ludGVkIG91dCBhbHJlYWR5LCBidXQg
ZHVtYiBidWZmZXJzICE9IEdFTQo+IGJ1ZmZlcnMuIEdFTSBidWZmZXJzIF9jYW5fIGJlIGR1bWIs
IGJ1dCBtaWdodCBub3QgYmUuCj4gCj4gQ291bGQgeW91IHBsZWFzZSByZW5hbWUgdG8gR0VNX1NF
VF9MQUJFTD8KPiAKCkRhbmllbCBhbmQgSSBoYWQgYSBvcHBvcnR1bml0eSB0byB0YWxrIGFib3V0
IHRoaXMgaW4gcGVyc29uIGFuZCB3ZSBhZ3JlZWQgdGhhdCAKSEFORExFX1NFVF9MQUJFTCB3b3Vs
ZCBiZSBhIG1vcmUgc2Vuc2libGUgbmFtZS4KCkNoZWVycwpSb2hhbiBHYXJnCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
