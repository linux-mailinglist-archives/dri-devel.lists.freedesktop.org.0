Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8C6AD025
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2019 19:17:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B04A0895B2;
	Sun,  8 Sep 2019 17:17:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 075F1895B2
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2019 17:17:51 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 5B86F8055B;
 Sun,  8 Sep 2019 19:17:49 +0200 (CEST)
Date: Sun, 8 Sep 2019 19:17:48 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 0/2] drm/panel: Extend panels to report their types
Message-ID: <20190908171748.GA3451@ravnborg.org>
References: <20190904132804.29680-1-laurent.pinchart@ideasonboard.com>
 <20190908171151.GB20115@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190908171151.GB20115@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=X4hfVhedjGUZqGd5H5AA:9 a=CjuIK1q_8ugA:10 a=pHzHmUro8NiASowvMSCR:22
 a=Ew2E2A-JSTLzCXPT_086:22
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
Cc: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudC4KCj4gPiBMYXVyZW50IFBpbmNoYXJ0ICgyKToKPiA+ICAgZHJtL3BhbmVsOiBB
ZGQgYW5kIGZpbGwgZHJtX3BhbmVsIHR5cGUgZmllbGQKPiA+ICAgZHJtL2JyaWRnZTogcGFuZWw6
IEluZmVyIGNvbm5lY3RvciB0eXBlIGZyb20gcGFuZWwgYnkgZGVmYXVsdAo+IAo+IEFwcGxpZWQg
YWxsIHRocmVlIHBhdGNoZXMgKGRlc3BpdGUgdGhpcyBzaG9ydGxvZyBvbmx5IHNob3dzIHR3bwo+
IHBhdGNoZXMpLgoKSSBndWVzcyB5b3Ugbm90aWNlZCB0aGF0IEkgaGF2ZSBiZWVuIGF3YXkgYSBs
aXR0bGUuClRoaXMgd2lsbCBjb250aW51ZSBmb3IgYXQgbGVhc3QgYW5vdGhlciB3ZWVrLgpkYXkt
dGltZSBqb2IgKyBzb21lIHRyYXZlbGxpbmcgYWhlYWQuCgoJU2FtCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
