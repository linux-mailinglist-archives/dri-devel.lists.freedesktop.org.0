Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27778D07C5B
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 09:23:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C7610E807;
	Fri,  9 Jan 2026 08:23:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FAEB10E807
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 08:23:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 45DDF40E53;
 Fri,  9 Jan 2026 08:23:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A29F0C4CEF1;
 Fri,  9 Jan 2026 08:23:35 +0000 (UTC)
Date: Fri, 9 Jan 2026 09:23:33 +0100
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
Subject: Re: [PATCH v2 3/6] dt-bindings: input:
 google,goldfish-events-keypad: Convert to DT schema
Message-ID: <20260109-remarkable-crane-of-exercise-6bc17f@quoll>
References: <20260108080836.3777829-1-visitorckw@gmail.com>
 <20260108080836.3777829-4-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260108080836.3777829-4-visitorckw@gmail.com>
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

On Thu, Jan 08, 2026 at 08:08:33AM +0000, Kuan-Wei Chiu wrote:
> +
> +examples:
> +  - |
> +    keypad@9040000 {
> +        compatible = "google,goldfish-events-keypad";
> +        reg = <0x9040000 0x1000>;
> +        interrupts = <0x5>;

Same comment as before. It applies everywhere, btw.

> +    };
> -- 
> 2.52.0.457.g6b5491de43-goog
> 
