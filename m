Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFE5433A6
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:31:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856B0894C0;
	Thu, 13 Jun 2019 07:28:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 493 seconds by postgrey-1.36 at gabe;
 Thu, 13 Jun 2019 00:34:23 UTC
Received: from outgoing-stata.csail.mit.edu (outgoing-stata.csail.mit.edu
 [128.30.2.210])
 by gabe.freedesktop.org (Postfix) with ESMTP id BF80D89263;
 Thu, 13 Jun 2019 00:34:23 +0000 (UTC)
Received: from [4.30.142.84] (helo=srivatsab-a01.vmware.com)
 by outgoing-stata.csail.mit.edu with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
 (Exim 4.82) (envelope-from <srivatsa@csail.mit.edu>)
 id 1hbDYq-000Xfo-J5; Wed, 12 Jun 2019 20:25:48 -0400
Subject: Re: [PATCH v4 18/28] docs: convert docs to ReST and rename to *.rst
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
References: <cover.1560361364.git.mchehab+samsung@kernel.org>
 <fac44e1fbab5ea755a93601a4fdfa34fcc57ae9e.1560361364.git.mchehab+samsung@kernel.org>
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Message-ID: <7dc94cb4-ebf1-22ab-29c9-fcb2b875a9ac@csail.mit.edu>
Date: Wed, 12 Jun 2019 17:25:39 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <fac44e1fbab5ea755a93601a4fdfa34fcc57ae9e.1560361364.git.mchehab+samsung@kernel.org>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:23 +0000
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
Cc: Nishanth Menon <nm@ti.com>, linux-wireless@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Viresh Kumar <viresh.kumar@linaro.org>,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>,
 Harry Wei <harryxiyou@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, Alex Shi <alex.shi@linux.alibaba.com>,
 Jonathan Corbet <corbet@lwn.net>, x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-pci@vger.kernel.org,
 Len Brown <len.brown@intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 intel-gfx@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@infradead.org>,
 Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, linux-pm@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi8xMi8xOSAxMDo1MiBBTSwgTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIHdyb3RlOgo+IENvbnZl
cnQgdGhlIFBNIGRvY3VtZW50cyB0byBSZVNULCBpbiBvcmRlciB0byBhbGxvdyB0aGVtIHRvCj4g
YnVpbGQgd2l0aCBTcGhpbnguCj4gCj4gVGhlIGNvbnZlcnNpb24gaXMgYWN0dWFsbHk6Cj4gICAt
IGFkZCBibGFuayBsaW5lcyBhbmQgaWRlbnRhdGlvbiBpbiBvcmRlciB0byBpZGVudGlmeSBwYXJh
Z3JhcGhzOwo+ICAgLSBmaXggdGFibGVzIG1hcmt1cHM7Cj4gICAtIGFkZCBzb21lIGxpc3RzIG1h
cmt1cHM7Cj4gICAtIG1hcmsgbGl0ZXJhbCBibG9ja3M7Cj4gICAtIGFkanVzdCB0aXRsZSBtYXJr
dXBzLgo+IAo+IEF0IGl0cyBuZXcgaW5kZXgucnN0LCBsZXQncyBhZGQgYSA6b3JwaGFuOiB3aGls
ZSB0aGlzIGlzIG5vdCBsaW5rZWQgdG8KPiB0aGUgbWFpbiBpbmRleC5yc3QgZmlsZSwgaW4gb3Jk
ZXIgdG8gYXZvaWQgYnVpbGQgd2FybmluZ3MuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWF1cm8gQ2Fy
dmFsaG8gQ2hlaGFiIDxtY2hlaGFiK3NhbXN1bmdAa2VybmVsLm9yZz4KPiBBY2tlZC1ieTogQmpv
cm4gSGVsZ2FhcyA8YmhlbGdhYXNAZ29vZ2xlLmNvbT4KPiBBY2tlZC1ieTogTWFyayBCcm93biA8
YnJvb25pZUBrZXJuZWwub3JnPgo+IC0tLQoKWy4uLl0KCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vcG93ZXIvc3VzcGVuZC1hbmQtY3B1aG90cGx1Zy50eHQgYi9Eb2N1bWVudGF0aW9uL3Bv
d2VyL3N1c3BlbmQtYW5kLWNwdWhvdHBsdWcucnN0Cj4gc2ltaWxhcml0eSBpbmRleCA5MCUKPiBy
ZW5hbWUgZnJvbSBEb2N1bWVudGF0aW9uL3Bvd2VyL3N1c3BlbmQtYW5kLWNwdWhvdHBsdWcudHh0
Cj4gcmVuYW1lIHRvIERvY3VtZW50YXRpb24vcG93ZXIvc3VzcGVuZC1hbmQtY3B1aG90cGx1Zy5y
c3QKPiBpbmRleCBhODc1MWI4ZGYxMGUuLjlkZjY2NGY1NDIzYSAxMDA2NDQKPiAtLS0gYS9Eb2N1
bWVudGF0aW9uL3Bvd2VyL3N1c3BlbmQtYW5kLWNwdWhvdHBsdWcudHh0Cj4gKysrIGIvRG9jdW1l
bnRhdGlvbi9wb3dlci9zdXNwZW5kLWFuZC1jcHVob3RwbHVnLnJzdAo+IEBAIC0xLDEwICsxLDE1
IEBACj4gKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09Cj4gIEludGVyYWN0aW9uIG9mIFN1c3BlbmQgY29kZSAoUzMpIHdp
dGggdGhlIENQVSBob3RwbHVnIGluZnJhc3RydWN0dXJlCj4gKz09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gIAo+IC0g
ICAgIChDKSAyMDExIC0gMjAxNCBTcml2YXRzYSBTLiBCaGF0IDxzcml2YXRzYS5iaGF0QGxpbnV4
LnZuZXQuaWJtLmNvbT4KPiArKEMpIDIwMTEgLSAyMDE0IFNyaXZhdHNhIFMuIEJoYXQgPHNyaXZh
dHNhLmJoYXRAbGludXgudm5ldC5pYm0uY29tPgo+ICAKPiAgCj4gLUkuIEhvdyBkb2VzIHRoZSBy
ZWd1bGFyIENQVSBob3RwbHVnIGNvZGUgZGlmZmVyIGZyb20gaG93IHRoZSBTdXNwZW5kLXRvLVJB
TQo+IC0gICBpbmZyYXN0cnVjdHVyZSB1c2VzIGl0IGludGVybmFsbHk/IEFuZCB3aGVyZSBkbyB0
aGV5IHNoYXJlIGNvbW1vbiBjb2RlPwo+ICtJLiBEaWZmZXJlbmNlcyBiZXR3ZWVuIENQVSBob3Rw
bHVnIGFuZCBTdXNwZW5kLXRvLVJBTQo+ICs9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT0KPiArCj4gK0hvdyBkb2VzIHRoZSByZWd1bGFyIENQVSBo
b3RwbHVnIGNvZGUgZGlmZmVyIGZyb20gaG93IHRoZSBTdXNwZW5kLXRvLVJBTQo+ICtpbmZyYXN0
cnVjdHVyZSB1c2VzIGl0IGludGVybmFsbHk/IEFuZCB3aGVyZSBkbyB0aGV5IHNoYXJlIGNvbW1v
biBjb2RlPwo+ICAKPiAgV2VsbCwgYSBwaWN0dXJlIGlzIHdvcnRoIGEgdGhvdXNhbmQgd29yZHMu
Li4gU28gQVNDSUkgYXJ0IGZvbGxvd3MgOi0pCj4gIAoKWy4uLl0KCj4gQEAgLTEwMSw3ICsxMDgs
NyBAQCBleGVjdXRpb24gZHVyaW5nIHJlc3VtZSk6Cj4gIAo+ICBJdCBpcyB0byBiZSBub3RlZCBo
ZXJlIHRoYXQgdGhlIHN5c3RlbV90cmFuc2l0aW9uX211dGV4IGxvY2sgaXMgYWNxdWlyZWQgYXQg
dGhlIHZlcnkKPiAgYmVnaW5uaW5nLCB3aGVuIHdlIGFyZSBqdXN0IHN0YXJ0aW5nIG91dCB0byBz
dXNwZW5kLCBhbmQgdGhlbiByZWxlYXNlZCBvbmx5Cj4gLWFmdGVyIHRoZSBlbnRpcmUgY3ljbGUg
aXMgY29tcGxldGUgKGkuZS4sIHN1c3BlbmQgKyByZXN1bWUpLgo+ICthZnRlciB0aGUgZW50aXJl
IGN5Y2xlIGlzIGNvbXBsZXRlIChpLmUuLCBzdXNwZW5kICsgcmVzdW1lKTo6Cj4gIAoKSSB0aGlu
ayB0aGF0IHNob3VsZCBiZSBhIHBlcmlvZCwgbm90IGEgY29sb24sIGJlY2F1c2UgaXQgaXMgY2xh
cmlmeWluZwp0aGUgdGV4dCBhYm92ZSBpdCAoYXMgb3Bwb3NlZCB0byByZWZlcnJpbmcgdG8gdGhl
IGV4YW1wbGUgYmVsb3cgaXQpLgoKT3RoZXIgdGhhbiB0aGF0LCBmb3Igc3VzcGVuZC1hbmQtY3B1
aG90cGx1Zy50eHQ6CgpBY2tlZC1ieTogU3JpdmF0c2EgUy4gQmhhdCAoVk13YXJlKSA8c3JpdmF0
c2FAY3NhaWwubWl0LmVkdT4KIApSZWdhcmRzLApTcml2YXRzYQpWTXdhcmUgUGhvdG9uIE9TCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
