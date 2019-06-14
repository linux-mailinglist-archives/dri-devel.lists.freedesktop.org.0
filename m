Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D30F46A33
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023E8894C9;
	Fri, 14 Jun 2019 20:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 773C78936C;
 Fri, 14 Jun 2019 20:36:34 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 731B91427;
 Fri, 14 Jun 2019 20:36:32 +0000 (UTC)
Date: Fri, 14 Jun 2019 14:36:31 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH v5] docs: power: convert docs to ReST and rename to *.rst
Message-ID: <20190614143631.7c99719f@lwn.net>
In-Reply-To: <72d1f8f360d395958dd0b49165fc51b58801f57e.1560420621.git.mchehab+samsung@kernel.org>
References: <7dc94cb4-ebf1-22ab-29c9-fcb2b875a9ac@csail.mit.edu>
 <72d1f8f360d395958dd0b49165fc51b58801f57e.1560420621.git.mchehab+samsung@kernel.org>
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
Cc: Nishanth Menon <nm@ti.com>, linux-wireless@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Viresh Kumar <viresh.kumar@linaro.org>,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>,
 Harry Wei <harryxiyou@gmail.com>, Pavel Machek <pavel@ucw.cz>, "H. Peter
 Anvin" <hpa@zytor.com>, Alex Shi <alex.shi@linux.alibaba.com>,
 "Srivatsa S . Bhat" <srivatsa@csail.mit.edu>, x86@kernel.org,
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

T24gVGh1LCAxMyBKdW4gMjAxOSAwNzoxMDozNiAtMDMwMApNYXVybyBDYXJ2YWxobyBDaGVoYWIg
PG1jaGVoYWIrc2Ftc3VuZ0BrZXJuZWwub3JnPiB3cm90ZToKCj4gQ29udmVydCB0aGUgUE0gZG9j
dW1lbnRzIHRvIFJlU1QsIGluIG9yZGVyIHRvIGFsbG93IHRoZW0gdG8KPiBidWlsZCB3aXRoIFNw
aGlueC4KPiAKPiBUaGUgY29udmVyc2lvbiBpcyBhY3R1YWxseToKPiAgIC0gYWRkIGJsYW5rIGxp
bmVzIGFuZCBpZGVudGF0aW9uIGluIG9yZGVyIHRvIGlkZW50aWZ5IHBhcmFncmFwaHM7Cj4gICAt
IGZpeCB0YWJsZXMgbWFya3VwczsKPiAgIC0gYWRkIHNvbWUgbGlzdHMgbWFya3VwczsKPiAgIC0g
bWFyayBsaXRlcmFsIGJsb2NrczsKPiAgIC0gYWRqdXN0IHRpdGxlIG1hcmt1cHMuCj4gCj4gQXQg
aXRzIG5ldyBpbmRleC5yc3QsIGxldCdzIGFkZCBhIDpvcnBoYW46IHdoaWxlIHRoaXMgaXMgbm90
IGxpbmtlZCB0bwo+IHRoZSBtYWluIGluZGV4LnJzdCBmaWxlLCBpbiBvcmRlciB0byBhdm9pZCBi
dWlsZCB3YXJuaW5ncy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXVybyBDYXJ2YWxobyBDaGVoYWIg
PG1jaGVoYWIrc2Ftc3VuZ0BrZXJuZWwub3JnPgo+IEFja2VkLWJ5OiBNYXJrIEJyb3duIDxicm9v
bmllQGtlcm5lbC5vcmc+Cj4gQWNrZWQtYnk6IEJqb3JuIEhlbGdhYXMgPGJoZWxnYWFzQGdvb2ds
ZS5jb20+Cj4gQWNrZWQtYnk6IFNyaXZhdHNhIFMuIEJoYXQgKFZNd2FyZSkgPHNyaXZhdHNhQGNz
YWlsLm1pdC5lZHU+CgpTbyBJIGNhbid0IGFwcGx5IHRoaXMgb25lIGR1ZSB0byBjb25mbGljdHMg
aW4gaW5jbHVkZS9saW51eC9wY2kuaC4gIEJqb3JuLApwZXJoYXBzIHRoZSBlYXNpZXN0IHRoaW5n
IGlzIGZvciB5b3UgdG8gdGFrZSB0aGlzIG9uZSB0aHJvdWdoIHlvdXIgdHJlZT8KClRoYW5rcywK
CmpvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
