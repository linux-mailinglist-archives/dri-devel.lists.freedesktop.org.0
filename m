Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A47D1724D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 09:00:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F82510E2FB;
	Tue, 13 Jan 2026 08:00:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3177E10E2FB
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 08:00:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6DD1C60055;
 Tue, 13 Jan 2026 08:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ED6CC19421;
 Tue, 13 Jan 2026 08:00:30 +0000 (UTC)
Date: Tue, 13 Jan 2026 09:00:28 +0100
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, dmitry.torokhov@gmail.com, sre@kernel.org, 
 gregkh@linuxfoundation.org, jirislaby@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, 
 jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 2/6] dt-bindings: misc: google,android-pipe: Convert
 to DT schema
Message-ID: <20260113-orange-cat-of-examination-b8d2a7@quoll>
References: <20260112185044.1865605-1-visitorckw@gmail.com>
 <20260112185044.1865605-3-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260112185044.1865605-3-visitorckw@gmail.com>
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

On Mon, Jan 12, 2026 at 06:50:40PM +0000, Kuan-Wei Chiu wrote:
> +examples:
> +  - |
> +    pipe@ff018000 {
> +        compatible = "google,android-pipe";
> +        reg = <0xff018000 0x2000>;
> +        interrupts = <0x12>;

Still not improved. I asked twice already. This is a nit, but I do not
understand why I need to ask for it three times.

Best regards,
Krzysztof

