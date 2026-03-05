Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPe9HemiqWl5BQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 16:36:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DDE214A0C
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 16:36:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F9A10E2C3;
	Thu,  5 Mar 2026 15:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com
 [216.40.44.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C6DE10E2BF;
 Thu,  5 Mar 2026 15:36:05 +0000 (UTC)
Received: from omf17.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay08.hostedemail.com (Postfix) with ESMTP id 9322C14014F;
 Thu,  5 Mar 2026 15:36:02 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf17.hostedemail.com (Postfix) with ESMTPA id E35031C; 
 Thu,  5 Mar 2026 15:35:55 +0000 (UTC)
Message-ID: <21e84301a7c37f9d5ce6f0ddcaed7846174d2a4d.camel@perches.com>
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
From: Joe Perches <joe@perches.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, Neil
 Armstrong	 <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, 	spacemit@lists.linux.dev,
 UNGLinuxDriver@microchip.com
Date: Thu, 05 Mar 2026 07:35:54 -0800
In-Reply-To: <20260305114352.2f7btqixg4tu5bzl@skbuf>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
 <20260305085148.7cwo3yflp7vcfldf@skbuf>
 <f3a5aa3df78553ffc0fd0024f5fd36a4e2158c88.camel@perches.com>
 <20260305114352.2f7btqixg4tu5bzl@skbuf>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-Stat-Signature: hdghxtayq5bkfzsomxmnfbydyyebzipf
X-Spam-Status: No, score=-0.09
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19f3I+nQL7Hl0m6eSD18a/IIsXK9f3qkJo=
X-HE-Tag: 1772724955-671908
X-HE-Meta: U2FsdGVkX1/X7uxRzGLN+IX8WCZcO8p7ZTfkKmYNWBtz0ybputMaHEYE9yjxoGJ588aNvqlmxPrL8260emaV8dmXUI0e+INEtvEJY25I/Ej/PwqlxILke5yF3tqaj6xtvov8nI2F5oYM0uwbLv+6+skyh/sdJqBRUfJJKxLUzixxjwVPNZYZfPXpcC3lGcz5BMW1nsCCc9lzUvpFfMAODgtiRdX4Al8waTK8ABKVHmTqbt8uPB5EPbopscO3f/XucT2DdozpyI3LxZQRIQw7tIxAWEpzWgj98RYMI3rQa9CVBr40+v4Qte7+qYx1OCa5
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
X-Rspamd-Queue-Id: 45DDE214A0C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [7.19 / 15.00];
	URIBL_BLACK(7.50)[perches.com:mid];
	MAILLIST(-0.20)[mailman];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[perches.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[joe@perches.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:131.252.210.177:c];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[perches.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: add header
X-Spam: Yes

On Thu, 2026-03-05 at 13:43 +0200, Vladimir Oltean wrote:

> K:	(?:struct\s+)?phy(?:_ops|_attrs|_lookup|_provider)?\b

You have (?:...)?phy(?:...)?\b

I rather doubt you want anything that ends in phy

That matches words like cryptography and way too many dts/yaml files
