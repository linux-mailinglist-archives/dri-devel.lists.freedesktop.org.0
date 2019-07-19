Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 352846E52C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 13:47:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A5B6E815;
	Fri, 19 Jul 2019 11:47:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id BC71B6E815
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 11:47:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43AA3337;
 Fri, 19 Jul 2019 04:47:05 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 240093F71A;
 Fri, 19 Jul 2019 04:47:05 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id E41C868065E; Fri, 19 Jul 2019 12:47:03 +0100 (BST)
Date: Fri, 19 Jul 2019 12:47:03 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Wen He <wen.he_1@nxp.com>
Subject: Re: [v2 2/3] dt/bindings: display: Add optional property node
 defined for Mali DP500
Message-ID: <20190719114703.GC16673@e110455-lin.cambridge.arm.com>
References: <20190719095842.11683-1-wen.he_1@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190719095842.11683-1-wen.he_1@nxp.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 leoyang.li@nxp.com, robh+dt@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTksIDIwMTkgYXQgMDU6NTg6NDJQTSArMDgwMCwgV2VuIEhlIHdyb3RlOgo+
IEFkZCBvcHRpb25hbCBwcm9wZXJ0eSBub2RlICdhcm0sbWFsaWRwLWFycW9zLXZhbHVlJyBmb3Ig
dGhlIE1hbGkgRFA1MDAuCj4gVGhpcyBwcm9wZXJ0eSBkZXNjcmliZSB0aGUgQVJRb1MgbGV2ZWxz
IG9mIERQNTAwJ3MgUW9TIHNpZ25hbGluZy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBXZW4gSGUgPHdl
bi5oZV8xQG54cC5jb20+CgpBY2tlZC1ieTogTGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1QGFybS5j
b20+CgpUaGFua3MgZm9yIHRoZSBwYXRjaCEKCkJlc3QgcmVnYXJkcywKTGl2aXUKCj4gLS0tCj4g
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2FybSxtYWxpZHAudHh0
IHwgMyArKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hcm0sbWFsaWRw
LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2FybSxtYWxp
ZHAudHh0Cj4gaW5kZXggMmY3ODcwOTgzZWYxLi43NmEwZTcyNTEyNTEgMTAwNjQ0Cj4gLS0tIGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYXJtLG1hbGlkcC50eHQK
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hcm0sbWFs
aWRwLnR4dAo+IEBAIC0zNyw2ICszNyw4IEBAIE9wdGlvbmFsIHByb3BlcnRpZXM6Cj4gICAgICBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVzZXJ2ZWQtbWVtb3J5L3Jlc2VydmVk
LW1lbW9yeS50eHQpCj4gICAgICB0byBiZSB1c2VkIGZvciB0aGUgZnJhbWVidWZmZXI7IGlmIG5v
dCBwcmVzZW50LCB0aGUgZnJhbWVidWZmZXIgbWF5Cj4gICAgICBiZSBsb2NhdGVkIGFueXdoZXJl
IGluIG1lbW9yeS4KPiArICAtIGFybSxtYWxpZHAtYXJxb3MtaGlnaC1sZXZlbDogaW50ZWdlciBv
ZiB1MzIgdmFsdWUgZGVzY3JpYmluZyB0aGUgQVJRb1MKPiArICAgIGxldmVscyBvZiBEUDUwMCdz
IFFvUyBzaWduYWxpbmcuCj4gIAo+ICAKPiAgRXhhbXBsZToKPiBAQCAtNTQsNiArNTYsNyBAQCBF
eGFtcGxlOgo+ICAJCWNsb2NrcyA9IDwmb3NjY2xrMj4sIDwmZnBnYW9zYzA+LCA8JmZwZ2Fvc2Mx
PiwgPCZmcGdhb3NjMT47Cj4gIAkJY2xvY2stbmFtZXMgPSAicHhsY2xrIiwgIm1jbGsiLCAiYWNs
ayIsICJwY2xrIjsKPiAgCQlhcm0sbWFsaWRwLW91dHB1dC1wb3J0LWxpbmVzID0gL2JpdHMvIDgg
PDggOCA4PjsKPiArCQlhcm0sbWFsaWRwLWFycW9zLWhpZ2gtbGV2ZWwgPSA8JnJxb3N2YWx1ZT47
Cj4gIAkJcG9ydCB7Cj4gIAkJCWRwMF9vdXRwdXQ6IGVuZHBvaW50IHsKPiAgCQkJCXJlbW90ZS1l
bmRwb2ludCA9IDwmdGRhOTk4eF8yX2lucHV0PjsKPiAtLSAKPiAyLjE3LjEKPiAKCi0tIAo9PT09
PT09PT09PT09PT09PT09PQp8IEkgd291bGQgbGlrZSB0byB8CnwgZml4IHRoZSB3b3JsZCwgIHwK
fCBidXQgdGhleSdyZSBub3QgfAp8IGdpdmluZyBtZSB0aGUgICB8CiBcIHNvdXJjZSBjb2RlISAg
LwogIC0tLS0tLS0tLS0tLS0tLQogICAgwq9cXyjjg4QpXy/CrwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
